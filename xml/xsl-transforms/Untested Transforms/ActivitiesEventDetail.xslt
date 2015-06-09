<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="ActivitiesEventDetail">
		<xsl:variable select="@ID" name="xid"></xsl:variable>
		<xsl:variable select="@Name" name="name"></xsl:variable>
		<ActivitiesEventDetail ID="{$xid}" Name="{$name}" IsComponent="false" Layout="byuidefault.xsl">
			<Title type="string" label="Title" readonly="false" hidden="false" required="true">
				<xsl:value-of select="Title"/>
			</Title>
			<Abstract type="string" label="Abstract" readonly="false" hidden="false" required="true">
				<xsl:value-of select="Abstract"/>
			</Abstract>
			<xPower Type="GroupStart" GroupStart="" Name="SocialMedia" label="Social Media" readonly="false" hidden="false" required="false" Expanded="false">
				<xsl:value-of select="xPower[@Name='SocialMedia']" />
			</xPower>
			<xPower Type="GroupStart" GroupStart="" Name="EventDetails" label="Event Details" readonly="false" hidden="false" required="false" Expanded="true">
				<xsl:copy-of select="EventCategory" />
				<xsl:copy-of select="EventSubcategory" />
				<xsl:copy-of select="EventThumbnail" />
				<xsl:copy-of select="EventDescription" />
				<xsl:copy-of select="EventLocation" />
				<xPower Type="GroupStart" GroupStart="" Name="DateInformation" label="Date Information" readonly="false" hidden="false" required="false" Expanded="true">
					<xsl:copy-of select="Dates" />
					<ActualDate type="date" label="Actual Date (If event repeats, enter date of first occurrence)" readonly="false" hidden="false" required="true" display="localdateshort">
						<xsl:value-of select="ActualDate" />
					</ActualDate>
					<RepeatDays type="multiselect" label="Repeats on days" readonly="false" hidden="false" required="false" MaxChoices="" PageSize="" Values="Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday">
						<xsl:value-of select="RepeatDays" />
					</RepeatDays>
					<RepeatsWeekly type="boolean" label="Repeats Weekly" readonly="false" hidden="false" required="false">
						<xsl:value-of select="RepeatsWeekly" />
					</RepeatsWeekly>
					<CustomDateList type="multiselect" label="Custom Date List" readonly="false" hidden="false" required="false" MaxChoices="99" PageSize="" Values="jan1|jan2|jan3|jan4|jan5|jan6|jan7|jan8|jan9|jan10|jan11|jan12|jan13|jan14|jan15|jan16|jan17|jan18|jan19|jan20|jan21|jan22|jan23|jan24|jan25|jan26|jan27|jan28|jan29|jan30|jan31|Feb1|Feb2|Feb3|Feb4|Feb5|Feb6|Feb7|Feb8|Feb9|Feb10|Feb11|Feb12|Feb13|Feb14|Feb15|Feb16|Feb17|Feb18|Feb19|Feb20|Feb21|Feb22|Feb23|Feb24|Feb25|Feb26|Feb27|Feb28|Feb29|Mar1|Mar2|Mar3|Mar4|Mar5|Mar6|Mar7|Mar8|Mar9|Mar10|Mar11|Mar12|Mar13|Mar14|Mar15|Mar16|Mar17|Mar18|Mar19|Mar20|Mar21|Mar22|Mar23|Mar24|Mar25|Mar26|Mar27|Mar28|Mar29|Mar30|Mar31|Apr1|Apr2|Apr3|Apr4|Apr5|Apr6|Apr7|Apr8|Apr9|Apr10|Apr11|Apr12|Apr13|Apr14|Apr15|Apr16|Apr17|Apr18|Apr19|Apr20|Apr21|Apr22|Apr23|Apr24|Apr25|Apr26|Apr27|Apr28|Apr29|Apr30|May1|May2|May3|May4|May5|May6|May7|May8|May9|May10|May11|May12|May13|May14|May15|May16|May17|May18|May19|May20|May21|May22|May23|May24|May25|May26|May27|May28|May29|May30|May31|Jun1|Jun2|Jun3|Jun4|Jun5|Jun6|Jun7|Jun8|Jun9|Jun10|Jun11|Jun12|Jun13|Jun14|Jun15|Jun16|Jun17|Jun18|Jun19|Jun20|Jun21|Jun22|Jun23|Jun24|Jun25|Jun26|Jun27|Jun28|Jun29|Jun30|Jul1|Jul2|Jul3|Jul4|Jul5|Jul6|Jul7|Jul8|Jul9|Jul10|Jul11|Jul12|Jul13|Jul14|Jul15|Jul16|Jul17|Jul18|Jul19|Jul20|Jul21|Jul22|Jul23|Jul24|Jul25|Jul26|Jul27|Jul28|Jul29|Jul30|Jul31|Aug1|Aug2|Aug3|Aug4|Aug5|Aug6|Aug7|Aug8|Aug9|Aug10|Aug11|Aug12|Aug13|Aug14|Aug15|Aug16|Aug17|Aug18|Aug19|Aug20|Aug21|Aug22|Aug23|Aug24|Aug25|Aug26|Aug27|Aug28|Aug29|Aug30|Aug31|Sep1|Sep2|Sep3|Sep4|Sep5|Sep6|Sep7|Sep8|Sep9|Sep10|Sep11|Sep12|Sep13|Sep14|Sep15|Sep16|Sep17|Sep18|Sep19|Sep20|Sep21|Sep22|Sep23|Sep24|Sep25|Sep26|Sep27|Sep28|Sep29|Sep30|Oct1|Oct2|Oct3|Oct4|Oct5|Oct6|Oct7|Oct8|Oct9|Oct10|Oct11|Oct12|Oct13|Oct14|Oct15|Oct16|Oct17|Oct18|Oct19|Oct20|Oct21|Oct22|Oct23|Oct24|Oct25|Oct26|Oct27|Oct28|Oct29|Oct30|Oct31|Nov1|Nov2|Nov3|Nov4|Nov5|Nov6|Nov7|Nov8|Nov9|Nov10|Nov11|Nov12|Nov13|Nov14|Nov15|Nov16|Nov17|Nov18|Nov19|Nov20|Nov21|Nov22|Nov23|Nov24|Nov25|Nov26|Nov27|Nov28|Nov29|Nov30|Dec1|Dec2|Dec3|Dec4|Dec5|Dec6|Dec7|Dec8|Dec9|Dec10|Dec11|Dec12|Dec13|Dec14|Dec15|Dec16|Dec17|Dec18|Dec19|Dec20|Dec21|Dec22|Dec23|Dec24|Dec25|Dec26|Dec27|Dec28|Dec29|Dec30|Dec31">
						<xsl:value-of select="CustomDateList" />
					</CustomDateList>
					<xsl:copy-of select="xPower[@Name='AvailableSemesters']" />
				</xPower>
				<xsl:copy-of select="EventTime" />
				<xPower Type="List" List="Price" Name="Prices" label="Prices" readonly="false" hidden="false" required="false" Expanded="true">
					<xsl:value-of select="xPower[@Name='Prices']" />]
				</xPower>
				<xsl:copy-of select="Dress" />
				<xsl:copy-of select="Food" />
			</xPower>
			<xPower Type="List" List="xhtml_Tile" Name="Gallery" label="Gallery" readonly="false" hidden="false" required="false" Expanded="true" Height="100px">
				<xsl:value-of select="xPower[@Name='Gallery']" />
			</xPower>
			<xsl:copy-of select="xPower[@Name=''EventContacts]" />
			<xsl:copy-of select="xPower[@Name='AncestorNavigation']" />
			<xPower Type="Component" Component="" Name="SiteControl" label="Site Control" readonly="false" hidden="false" required="false" CompTypes="SiteControl"/>
		</ActivitiesEventDetail>
	</xsl:template>
</xsl:stylesheet>