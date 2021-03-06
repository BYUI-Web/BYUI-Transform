﻿namespace BYUI_Transformer
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
            this.searchProgress = new System.Windows.Forms.ProgressBar();
            this.menu = new System.Windows.Forms.MenuStrip();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.menu.SuspendLayout();
            this.SuspendLayout();
            // 
            // cmPageType
            // 
            this.cmPageType.FormattingEnabled = true;
            this.cmPageType.Location = new System.Drawing.Point(14, 29);
            this.cmPageType.Name = "cmPageType";
            this.cmPageType.Size = new System.Drawing.Size(498, 21);
            this.cmPageType.TabIndex = 0;
            this.cmPageType.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // convertButton
            // 
            this.convertButton.Location = new System.Drawing.Point(437, 315);
            this.convertButton.Name = "convertButton";
            this.convertButton.Size = new System.Drawing.Size(75, 23);
            this.convertButton.TabIndex = 2;
            this.convertButton.Text = "Transform";
            this.convertButton.UseVisualStyleBackColor = true;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // directoryLabel
            // 
            this.directoryLabel.AutoSize = true;
            this.directoryLabel.Location = new System.Drawing.Point(12, 63);
            this.directoryLabel.Name = "directoryLabel";
            this.directoryLabel.Size = new System.Drawing.Size(107, 13);
            this.directoryLabel.TabIndex = 3;
            this.directoryLabel.Text = "Select XML Directory";
            // 
            // btChooseDirectory
            // 
            this.btChooseDirectory.Enabled = false;
            this.btChooseDirectory.Location = new System.Drawing.Point(14, 79);
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
            this.stopSearch.Enabled = false;
            this.stopSearch.Location = new System.Drawing.Point(360, 315);
            this.stopSearch.Name = "stopSearch";
            this.stopSearch.Size = new System.Drawing.Size(75, 23);
            this.stopSearch.TabIndex = 7;
            this.stopSearch.Text = "Stop Search";
            this.stopSearch.UseVisualStyleBackColor = true;
            // 
            // searchProgress
            // 
            this.searchProgress.ForeColor = System.Drawing.SystemColors.MenuHighlight;
            this.searchProgress.Location = new System.Drawing.Point(15, 286);
            this.searchProgress.Name = "searchProgress";
            this.searchProgress.Size = new System.Drawing.Size(497, 23);
            this.searchProgress.TabIndex = 8;
            this.searchProgress.Visible = false;
            // 
            // menu
            // 
            this.menu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.helpToolStripMenuItem,
            this.helpToolStripMenuItem1});
            this.menu.Location = new System.Drawing.Point(0, 0);
            this.menu.Name = "menu";
            this.menu.Size = new System.Drawing.Size(528, 24);
            this.menu.TabIndex = 9;
            this.menu.Text = "menuStrip1";
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem});
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
            this.helpToolStripMenuItem.Text = "File";
            this.helpToolStripMenuItem.Click += new System.EventHandler(this.helpToolStripMenuItem_Click);
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.F4)));
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.aboutToolStripMenuItem.Text = "Quit";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // helpToolStripMenuItem1
            // 
            this.helpToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem1});
            this.helpToolStripMenuItem1.Name = "helpToolStripMenuItem1";
            this.helpToolStripMenuItem1.Size = new System.Drawing.Size(44, 20);
            this.helpToolStripMenuItem1.Text = "Help";
            // 
            // aboutToolStripMenuItem1
            // 
            this.aboutToolStripMenuItem1.Name = "aboutToolStripMenuItem1";
            this.aboutToolStripMenuItem1.Size = new System.Drawing.Size(152, 22);
            this.aboutToolStripMenuItem1.Text = "About";
            this.aboutToolStripMenuItem1.Click += new System.EventHandler(this.aboutToolStripMenuItem1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(528, 352);
            this.Controls.Add(this.searchProgress);
            this.Controls.Add(this.stopSearch);
            this.Controls.Add(this.pagesFound);
            this.Controls.Add(this.lbPagesToUpdate);
            this.Controls.Add(this.btChooseDirectory);
            this.Controls.Add(this.directoryLabel);
            this.Controls.Add(this.convertButton);
            this.Controls.Add(this.cmPageType);
            this.Controls.Add(this.menu);
            this.MainMenuStrip = this.menu;
            this.Name = "Form1";
            this.Text = "BYUI Page Converter";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.menu.ResumeLayout(false);
            this.menu.PerformLayout();
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
        private System.Windows.Forms.ProgressBar searchProgress;
        private System.Windows.Forms.MenuStrip menu;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem1;
    }
}

