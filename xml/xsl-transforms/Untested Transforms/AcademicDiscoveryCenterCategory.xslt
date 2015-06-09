<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="AcademicDiscoveryCenterCategory">
		<xsl:variable select="@ID" name="xid"></xsl:variable>
		<xsl:variable select="@Name" name="name"></xsl:variable>
		<AcademicDiscoveryCenterCategory ID="{$xid}" Name="{$name}" Layout="byuidefault.xsl" IsComponent="false">
			<Title type="string" label="Title" readonly="false" hidden="false" required="true">
				<xsl:value-of select="Title"/>
			</Title>
			<Abstract type="string" label="Abstract" readonly="false" hidden="false" required="true">
				<xsl:value-of select="Abstract"/>
			</Abstract>
			<xPower Type="GroupStart" GroupStart="" Name="SEOGroup" label="SEO Group" readonly="false" hidden="false" required="false" Expanded="false">
				<xsl:value-of select="xPower[@Name='SEOGroup']" />
			</xPower>
			<xPower Type="GroupStart" GroupStart="" Name="SocialMedia" label="Social Media" readonly="false" hidden="false" required="false" Expanded="false">
				<xsl:value-of select="xPower[@Name='SocialMedia']" />
			</xPower>
			<xsl:copy-of select="xPower[@Name='Navigation']" />
			<BodyCopy type="dhtml" label="Article Body" readonly="false" hidden="false" required="false" Height="">
				<xsl:value-of select="BodyCopy" />
			</BodyCopy>
			<xsl:choose>
				<xsl:when test="xPower[@Name='ParentCategories']">
					<xPower Type="List" List="xpowertaxonomynavigation_ParentCategory" Name="ParentCategories" label="Parent Categories" readonly="false" hidden="false" required="false" Expanded="true" StartNodes="" IncludePages="true" Depth="" FilterSchemas="" FilterParentPages="">
						<xsl:choose>
							<xsl:when test="xPower[@Name='ParentCategories']/@FilterParentPages">
								<xsl:attribute name="FilterParentPages">
									<xsl:value-of select="xPower[@Name='ParentCategories']/@FilterParentPages"/>
								</xsl:attribute>
							</xsl:when>
						</xsl:choose>
						<xsl:value-of select="xPower[@Name='ParentCategories']" />
					</xPower>
				</xsl:when>
				<xsl:otherwise>
					<xPower Type="List" List="xpowertaxonomynavigation_ParentCategory" Name="ParentCategories" label="Parent Categories" readonly="false" hidden="false" required="false" Expanded="true" StartNodes="" IncludePages="true" Depth="" FilterSchemas="" FilterParentPages="">
					</xPower>
				</xsl:otherwise>
			</xsl:choose>
			<xPower Type="Navigation" StartPage="" MaxDepth="" MaxNodes="" GenerationOrder="down" Navigation="Children" Query="" Name="DeptEvents" label="Define Your Events Folder" readonly="false" hidden="false" required="false" Expanded="false"/>
			<xPower Type="List" List="xpowercomponent_ContentSnippet" Name="ContentSnippet" label="Content Snippet" readonly="false" hidden="false" required="false" Expanded="false" Component="" CompTypes="ContentSnippet">
				<xsl:value-of select="xPower[@Name='ContentSnippet']" />
			</xPower>
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
					<xPower Type="Component" Component="" Name="SiteControl" label="Site Control" readonly="true" hidden="false" required="false" CompTypes="SiteControl"/>
				</xsl:otherwise>
			</xsl:choose>

		</AcademicDiscoveryCenterCategory>
	</xsl:template>
</xsl:stylesheet>