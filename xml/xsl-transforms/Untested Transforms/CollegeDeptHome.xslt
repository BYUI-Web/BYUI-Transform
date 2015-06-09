<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="CollegeDeptHome">
		<xsl:variable select="@ID" name="xid"></xsl:variable>
		<xsl:variable select="@Name" name="name"></xsl:variable>
		<CollegeDeptHome ID="{$xid}" Name="{$name}" Layout="college-dept_home.xsl" IsComponent="false">
			<Title type="string" label="Title" readonly="false" hidden="false" required="true">
				<xsl:value-of select="Title"/>
			</Title>
			<Abstract type="string" label="Abstract" readonly="false" hidden="false" required="true">
				<xsl:value-of select="Abstract"/>
			</Abstract>
			<IsResponsive type="boolean" label="Mobile Ready (responsive)" readonly="false" hidden="false" required="false">false</IsResponsive>

			<xPower Type="List" Name="MainImages" label="Top Image(s) (950px width, 335px height required)" readonly="false" hidden="false" required="false" Expanded="" List="">
				<xsl:value-of select="xPower[@Name='MainImages']"></xsl:value-of>
			</xPower>

			<xPower Type="GroupStart" Name="Main" label="Main Content" readonly="false" hidden="false" required="false" Expanded="true" GroupStart="">
				<xsl:value-of select="xPower[@Name='Main']"></xsl:value-of>
			</xPower>

			<xPower Type="GroupStart" Name="FaceBook" label="Facebook Integration" readonly="false" hidden="false" required="false" Expanded="false" GroupStart="">
				<xsl:value-of select="xPower[@Name='FaceBook']"></xsl:value-of>
			</xPower>

			<xsl:choose>
				<xsl:when test="BannerAd">
					<xsl:copy-of select="BannerAd" />
				</xsl:when>
				<xsl:otherwise>
					<BannerAd type="multiselect" label="Rotating Ads" readonly="false" hidden="false" required="false" MaxChoices="" PageSize="" Query_PageType="BannerAdComponent" Query_LocationRoot="x6922" Query_SelectedFields="@Name|@ID" AdditionalFilter_XPathQuery=""/>
				</xsl:otherwise>
			</xsl:choose>

			<xPower Type="GroupStart" Name="QuickLinksGroup" label="Quick Links Group" readonly="false" hidden="false" required="false" Expanded="false" GroupStart="">
				<xsl:value-of select="xPower[@Name='QuickLinksGroup']"></xsl:value-of>
			</xPower>

			<xsl:choose>
				<xsl:when test="xPower[@Name='HighlightedLinks']">
					<xsl:copy-of select="xPower[@Name='HighlightedLinks']" />
				</xsl:when>
				<xsl:otherwise>
					<xPower Type="Component" Name="HighlightedLinks" label="Highlighted Links" readonly="false" hidden="false" required="false" Component="" CompTypes="HighlightedLinksComponent" Expanded="false"/>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="xPower[@Name='DeptEvents']">
					<xsl:copy-of select="xPower[@Name='DeptEvents']" />
				</xsl:when>
				<xsl:otherwise>
					<xPower Type="Navigation" Name="DeptEvents" label="Define Your Events Folder" readonly="false" hidden="false" required="false" Expanded="false" Navigation="Children" GenerationOrder="down" StartPage="" MaxNodes="" MaxDepth="" Query=""/>
				</xsl:otherwise>
			</xsl:choose>

			<xPower Type="Navigation" Name="DeptAds" label="Define Your Ads Folder" readonly="false" hidden="false" required="false" Expanded="false" Navigation="Children" GenerationOrder="down" StartPage="x7060" MaxNodes="" MaxDepth="" Query="">
				<xsl:value-of select="xPower[@Name='DeptAds']"></xsl:value-of>
			</xPower>

			<xPower Type="GroupStart" Name="SEOGroup" label="SEO Group" readonly="false" hidden="false" required="false" Expanded="false" GroupStart="">
				<xsl:value-of select="xPower[@Name='SEOGroup']"></xsl:value-of>
			</xPower>

			<xPower Type="List" Name="ContentSnippet" label="Content Snippet" readonly="false" hidden="false" required="false" Expanded="" List="">
				<xsl:value-of select="xPower[@Name='ContentSnippet']"></xsl:value-of>
			</xPower>

			<xsl:choose>
				<xsl:when test="xPower[@Name='AncestorNavigation']">
					<xsl:copy-of select="xPower[@Name='AncestorNavigation']" />
				</xsl:when>
				<xsl:otherwise>
					<xPower Type="Navigation" Name="AncestorNavigation" label="Ancestor Navigation" readonly="true" hidden="true" required="false" Expanded="false" Navigation="Ancestors" GenerationOrder="down" StartPage="" MaxNodes="" MaxDepth="" Query=""/>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="xPower[@Name='SiteControl']">
					<xsl:copy-of select="xPower[@Name='SiteControl']" />
				</xsl:when>
				<xsl:otherwise>
					<xPower Type="Component" Name="SiteControl" label="Site Control" readonly="true" hidden="false" required="false" Component="" CompTypes="SiteControl" Expanded="false"/>
				</xsl:otherwise>
			</xsl:choose>
		</CollegeDeptHome>
	</xsl:template>
</xsl:stylesheet>