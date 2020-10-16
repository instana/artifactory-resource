<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:for-each select="/metadata/versioning/versions/version">
            <xsl:value-of select="." />
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>