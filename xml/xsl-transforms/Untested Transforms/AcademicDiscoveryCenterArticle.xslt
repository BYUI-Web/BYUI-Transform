<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="AcademicDiscoveryCenterArticle">
		<xsl:variable select="@ID" name="xid"></xsl:variable>
		<xsl:variable select="@Name" name="name"></xsl:variable>
		<AcademicDiscoveryCenterArticle ID="{$xid}" Name="{$name}" Layout="byuidefault.xsl" IsComponent="false">
			<Title type="string" label="Title" readonly="false" hidden="false" required="true">
				<xsl:value-of select="Title"/>
			</Title>
			<Abstract type="string" label="Abstract" readonly="false" hidden="false" required="true">
				<xsl:value-of select="Abstract"/>
			</Abstract>
			<Subtitle type="string" label="Subtitle" readonly="false" hidden="false" required="false">
				<xsl:value-of select="Subtitle"/>
			</Subtitle>
			<xPower Type="GroupStart" GroupStart="" Name="SEOGroup" label="SEO Group" readonly="false" hidden="false" required="false" Expanded="false">
				<xsl:value-of select="xPower[@Name='SEOGroup']" />
			</xPower>
			<xPower Type="GroupStart" GroupStart="" Name="SocialMedia" label="Social Media" readonly="false" hidden="false" required="false" Expanded="false">
				<xsl:value-of select="xPower[@Name='SocialMedia']" />
			</xPower>
			<BodyCopy type="dhtml" label="Article Body" readonly="false" hidden="false" required="false" Height="">
				<xsl:value-of select="BodyCopy" />
			</BodyCopy>
			<xsl:choose>
				<xsl:when test="xPower[@Name='DeptEvents']">
					<xsl:copy-of select="xPower[@Name='DeptEvents']" />
				</xsl:when>
				<xsl:otherwise>
					<xPower Type="Navigation" StartPage="" MaxDepth="" MaxNodes="" GenerationOrder="down" Navigation="Children" Query="" Name="DeptEvents" label="Define Your Events Folder" readonly="false" hidden="false" required="false" Expanded="false"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="xPower[@Name='AncestorNavigation']">
					<xsl:copy-of select="xPower[@Name='AncestorNavigation']" />
				</xsl:when>
				<xsl:otherwise>
					<xPower Type="Navigation" StartPage="" MaxDepth="" MaxNodes="" GenerationOrder="down" Navigation="Ancestors" Query="" Name="AncestorNavigation" label="Ancestor Navigation" readonly="true" hidden="true" required="false" Expanded="false"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="xPower[@Name='SiteControl']">
					<xsl:copy-of select="xPower[@Name='SiteControl']" />
				</xsl:when>
				<xsl:otherwise>
					<xPower Type="Component" Component="" Name="SiteControl" label="Site Control" readonly="true" hidden="false" required="false" CompTypes="SiteControl" Expanded="false"/>
				</xsl:otherwise>
			</xsl:choose>
		</AcademicDiscoveryCenterArticle>
	</xsl:template>
</xsl:stylesheet>