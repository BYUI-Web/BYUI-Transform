# BYU-I Page Type Transformer
This application searches a specified directory of XML files for pages of a specified schema. After this search the user is able to select all or some of the pages found and apply an XSL transform to them. This application was specificaly built for transforming outdated Ingeniux pages to more current schemas.

## Usage
The application requires the following:

1. Windows 7+
2. The directory with the XML to transform must contain a folder named 'xsl-transforms' containing the XSLT files used for transforming.
3. The XSLT files in the 'xsl-transforms' directory must have the same name as the root element of the schemas they transform (e.g. 'Content_wSideColumn.xslt').

Note that after the transforms have been applied backups of the previous file versions are created. These backups are in the same directory with '_Replaced' added to the end of the filename.

## Folder Overview
A description of each folder in the repo is given bellow

### Visual Studio Project
This folder contains source code of the application and visual studio project files.

### Published Application
This folder contains the installation files for the application.

### xml
This is a directory of XML files for testing the application.

