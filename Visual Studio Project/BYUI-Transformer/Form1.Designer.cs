namespace BYUI_Transformer
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cmPageType = new System.Windows.Forms.ComboBox();
            this.convertButton = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.directoryLabel = new System.Windows.Forms.Label();
            this.btChooseDirectory = new System.Windows.Forms.Button();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.lbPagesToUpdate = new System.Windows.Forms.ListBox();
            this.pagesFound = new System.Windows.Forms.Label();
            this.stopSearch = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cmPageType
            // 
            this.cmPageType.FormattingEnabled = true;
            this.cmPageType.Location = new System.Drawing.Point(14, 12);
            this.cmPageType.Name = "cmPageType";
            this.cmPageType.Size = new System.Drawing.Size(498, 21);
            this.cmPageType.TabIndex = 0;
            this.cmPageType.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // convertButton
            // 
            this.convertButton.Location = new System.Drawing.Point(437, 298);
            this.convertButton.Name = "convertButton";
            this.convertButton.Size = new System.Drawing.Size(75, 23);
            this.convertButton.TabIndex = 2;
            this.convertButton.Text = "Convert";
            this.convertButton.UseVisualStyleBackColor = true;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // directoryLabel
            // 
            this.directoryLabel.AutoSize = true;
            this.directoryLabel.Location = new System.Drawing.Point(12, 49);
            this.directoryLabel.Name = "directoryLabel";
            this.directoryLabel.Size = new System.Drawing.Size(107, 13);
            this.directoryLabel.TabIndex = 3;
            this.directoryLabel.Text = "Select XML Directory";
            // 
            // btChooseDirectory
            // 
            this.btChooseDirectory.Enabled = false;
            this.btChooseDirectory.Location = new System.Drawing.Point(14, 65);
            this.btChooseDirectory.Name = "btChooseDirectory";
            this.btChooseDirectory.Size = new System.Drawing.Size(75, 23);
            this.btChooseDirectory.TabIndex = 4;
            this.btChooseDirectory.Text = "Choose...";
            this.btChooseDirectory.UseVisualStyleBackColor = true;
            // 
            // lbPagesToUpdate
            // 
            this.lbPagesToUpdate.FormattingEnabled = true;
            this.lbPagesToUpdate.Location = new System.Drawing.Point(15, 120);
            this.lbPagesToUpdate.Name = "lbPagesToUpdate";
            this.lbPagesToUpdate.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended;
            this.lbPagesToUpdate.Size = new System.Drawing.Size(497, 160);
            this.lbPagesToUpdate.TabIndex = 5;
            // 
            // pagesFound
            // 
            this.pagesFound.AutoSize = true;
            this.pagesFound.Location = new System.Drawing.Point(15, 101);
            this.pagesFound.Name = "pagesFound";
            this.pagesFound.Size = new System.Drawing.Size(0, 13);
            this.pagesFound.TabIndex = 6;
            // 
            // stopSearch
            // 
            this.stopSearch.Location = new System.Drawing.Point(356, 298);
            this.stopSearch.Name = "stopSearch";
            this.stopSearch.Size = new System.Drawing.Size(75, 23);
            this.stopSearch.TabIndex = 7;
            this.stopSearch.Text = "Stop Search";
            this.stopSearch.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(524, 333);
            this.Controls.Add(this.stopSearch);
            this.Controls.Add(this.pagesFound);
            this.Controls.Add(this.lbPagesToUpdate);
            this.Controls.Add(this.btChooseDirectory);
            this.Controls.Add(this.directoryLabel);
            this.Controls.Add(this.convertButton);
            this.Controls.Add(this.cmPageType);
            this.Name = "Form1";
            this.Text = "BYUI Page Converter";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cmPageType;
        private System.Windows.Forms.Button convertButton;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Label directoryLabel;
        private System.Windows.Forms.Button btChooseDirectory;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.ListBox lbPagesToUpdate;
        private System.Windows.Forms.Label pagesFound;
        private System.Windows.Forms.Button stopSearch;
    }
}

