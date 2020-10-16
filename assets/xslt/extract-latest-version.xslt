<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:value-of select="/metadata/versioning/release"/>
    </xsl:template>
</xsl:stylesheet>