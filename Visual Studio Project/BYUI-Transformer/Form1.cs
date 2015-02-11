using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Xsl;

namespace BYUI_Transformer
{
    public partial class Form1 : Form
    {
        //list of available transforms
        private BindingList<String> availablePages = new BindingList<String>();

        //directory to search
        private String direcotryPath = "";

        //background worker for searching files
        BackgroundWorker worker = new BackgroundWorker();

        //total number of files to search
        private double numberOfFiles = 0;

        public Form1()
        {
            InitializeComponent();

            //disable form resizing
            this.FormBorderStyle = FormBorderStyle.FixedSingle;

            //register the  button on click events
            convertButton.Click += new EventHandler(this.convertButton_Click);
            btChooseDirectory.Click += new EventHandler(this.btChooseDirectory_Click);


            //add the available pages
            //Please note that the string added to the list must match the root element name of the page type exactly
            availablePages.Add("Select a Page Type");
            availablePages.Add("Content_wSideColumn");
            availablePages.Add("Content_FullWidth");

            //bind the list to the multi select
            cmPageType.DataSource = availablePages;

            //register the worker do work and call back methods
            worker.DoWork += new DoWorkEventHandler(worker_DoWork);
            worker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(worker_RunWorkerCompleted);
            worker.WorkerReportsProgress = true;
            worker.ProgressChanged += new ProgressChangedEventHandler(worker_ProgressChanged);
            worker.WorkerSupportsCancellation = true;

            stopSearch.Click += new EventHandler(stopSearch_Click);
        }

        /// <summary>
        /// Stops the search.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void stopSearch_Click(object sender, EventArgs e)
        {
            worker.CancelAsync();

            pagesFound.Text = pagesFound.Text.Substring(0, pagesFound.Text.IndexOf("cli"));

            searchProgress.Visible = false;

            stopSearch.Enabled = false;
        }

        /// <summary>
        /// If the page type is changed and a directory has been selected, enable path button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmPageType.SelectedIndex != 0)
            {
                btChooseDirectory.Enabled = true;
            }
            else
            {
                btChooseDirectory.Enabled = false;
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void convertButton_Click(object sender, EventArgs e)
        {
            //stop any search threads that were running
            worker.CancelAsync();

            var selectedCount = lbPagesToUpdate.SelectedItems.Count;

            if (selectedCount > 0)
            {
                DialogResult dialogResult = MessageBox.Show("Are you sure you want to transform " + selectedCount + " pages?", "Transform?", MessageBoxButtons.YesNo);
                if (dialogResult == DialogResult.Yes)
                {
                    transformSelected();
                }
            }
        }

        /// <summary>
        /// Opens the choose folder dialog. If a valid folder is chosen a search for files of the specified pagetype begins.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btChooseDirectory_Click(object sender, EventArgs e)
        {
            //stop any search threads that were running
            worker.CancelAsync();

            // Show the dialog and get result.
            DialogResult result = folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK) // Test result.
            {
                string file = openFileDialog1.FileName;
                try
                {
                    //enable the stop search button and progress bar
                    stopSearch.Enabled = true;
                    searchProgress.Visible = true;

                    //get the selected path and set necessary variables
                    file = folderBrowserDialog1.SelectedPath;
                    directoryLabel.Text = file;
                    direcotryPath = file;

                    //get the number of files to search
                    numberOfFiles = Directory.GetFiles(file, "*", SearchOption.TopDirectoryOnly).Length;

                    //search the directory if a page type has been selected
                    if (cmPageType.SelectedIndex != 0)
                    {
                        //stop any search threads that were running
                        worker.CancelAsync();

                        worker.RunWorkerAsync(cmPageType.SelectedItem.ToString());
                    }
                    else
                    {
                        cmPageType.Focus();
                    }
                }
                catch (IOException)
                {
                    Console.WriteLine("Error: Could not open the specified directory.");
                }
            }
        }

        private void transformSelected()
        {
            if (lbPagesToUpdate.SelectedItems.Count > 0)
            {
                try
                {
                    //stop the search if it is still going on
                    worker.CancelAsync();

                    //collection of all pages to transform
                    var selectedPages = lbPagesToUpdate.SelectedItems;

                    //get the transform
                    XslCompiledTransform pageTransform = new XslCompiledTransform();
                    pageTransform.Load(direcotryPath + "\\xsl-transforms\\" + cmPageType.SelectedItem + ".xslt");

                    //transform each page
                    foreach (var page in selectedPages)
                    {
                        var fileName = direcotryPath.ToString() + "\\" + page.ToString().Substring(page.ToString().LastIndexOf("\\") + 1) + "_temp";
                        pageTransform.Transform(page.ToString(), fileName);

                        //move the file
                        if (File.Exists(fileName))
                        {
                            File.Replace(fileName, page.ToString(), page.ToString() + "_Replaced", true);
                        }
                    }

                    MessageBox.Show("Finished Transformation.");
                }
                catch (FileNotFoundException e)
                {
                    MessageBox.Show("Error: could not find the XSL transform. Please make sure " + direcotryPath + "\\xsl-transforms\\" + cmPageType.SelectedItem + ".xsl exists.");
                }
            }
        }

        /// <summary>
        /// This function is executed when the seraach finishes.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void worker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {

        }

        /// <summary>
        /// Searches the selected directory for pages with the selected page type.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void worker_DoWork(object sender, DoWorkEventArgs e)
        {
            // Worker thread
            BackgroundWorker bkgwk = sender as BackgroundWorker;

            //files to update
            String pagesFound = "";
            String pageMatch = (String)e.Argument;

            //for every file in the directory
            int loopCount = 0;
            foreach (var file in Directory.GetFiles(this.direcotryPath))
            {
                if (bkgwk.CancellationPending)
                {
                    break;
                }

                loopCount++;
                int counter = 0;
                string line;

                // Read the file and display it line by line.
                try
                {
                    System.IO.StreamReader currentFile = new System.IO.StreamReader(file);

                    while (counter <= 3)
                    {
                        line = currentFile.ReadLine();

                        //if there was a line to read
                        if (line != null)
                        {
                            //check if contains the page type
                            if (line.Contains(pageMatch) && !file.Contains("_Replaced"))
                            {
                                //if page type was found, add it to the list of files
                                pagesFound += "^" + file;
                                break;
                            }
                        }
                        else
                        {
                            //if no more lines, break out of while loop early
                            break;
                        }

                        counter++;
                    }

                    currentFile.Close();
                }
                catch(IOException ex)
                {
                    Console.Write(ex);
                }

                //update the count label every 100 iterations
                if (loopCount % 100 == 0)
                {
                    bkgwk.ReportProgress(0,pagesFound.Split('^').Count().ToString() + "^" + loopCount);
                }
            }

            bkgwk.ReportProgress(1, pagesFound);

        }

        /// <summary>
        /// Updates the UI with the current number of pages matching the criteria found. When the search finishes,
        /// this method sends back all the files found with the matching page type.
        /// </summary>
        /// <param name="sender">Background Worker</param>
        /// <param name="e"></param>
        private void worker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            //do the update here
            if (e.ProgressPercentage == 1)
            {
                lbPagesToUpdate.DataSource = new BindingList<String>(e.UserState.ToString().Split('^'));

                //stop any threads and disable the stop search button
                worker.CancelAsync();

                try
                {
                    pagesFound.Text = pagesFound.Text.Substring(0, pagesFound.Text.IndexOf("cli"));
                }
                catch (Exception ex)
                {
                    //the text was already changed.
                }

                searchProgress.Visible = false;

                stopSearch.Enabled = false;
            }
            else
            {
                string numberFound = e.UserState.ToString().Substring(0, e.UserState.ToString().IndexOf('^'));
                string loopCount = e.UserState.ToString().Substring(e.UserState.ToString().IndexOf('^') + 1);

                pagesFound.Text = "Pages found: " + numberFound + " click 'stop search' to stop search and view current results.";

                //update the progress bar
                try
                {
                    searchProgress.Value = Convert.ToInt32(Convert.ToDouble(loopCount) / (double)numberOfFiles * 100);
                }
                catch (Exception ex)
                {
                    //do nothing
                }
            }
        }
    }
}
