<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy-compat" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Carole's Clothes - Handmade Fashion</title>
                <style>
        body {
            font-family: 'Helvetica', 'Arial', sans-serif;
            background-color: #fafafa;
            color: #333;
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
        }
        .category-header {
            text-transform: uppercase;
            font-size: 0.9em;
            font-weight: bold;
            letter-spacing: 1px;
            background-color: #4a4a8c;
            color: white;
            padding: 8px 15px;
            margin-top: 30px;
            border-radius: 4px 4px 0 0;
        }
        .item {
            background-color: #fff;
            margin-bottom: 25px;
            border-radius: 0 0 6px 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .item-content {
            padding: 15px;
        }
        .item-name {
            font-size: 1.6em;
            font-weight: bold;
            color: #2c2c2c;
            margin-bottom: 5px;
        }
        .item-price {
            font-size: 1.3em;
            color: #e91e63;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .item-description {
            line-height: 1.5;
            color: #555;
            margin-bottom: 15px;
        }
        .fabric-image {
            max-width: 250px;
            border-radius: 4px;
            margin: 10px 0;
        }
        audio {
            margin: 10px 0;
            width: 100%;
            max-width: 250px;
        }
        .category-group {
            margin-bottom: 40px;
        }
                </style>
            </head>
            <body>
                <h1>Carole's Clothes</h1>
                <h2>Handmade Fashion Collection</h2>

                <!-- Group items by category -->
                <xsl:for-each select="caroles_clothes/item[not(@category=preceding-sibling::item/@category)]">
                    <xsl:variable name="current-category" select="@category"/>

                    <div class="category-group">
                        <div class="category-header">
                            <xsl:value-of select="$current-category"/>
S
                        </div>

                        <xsl:for-each select="/caroles_clothes/item[@category=$current-category]">
                            <div class="item">
                                <div class="item-content">
                                    <div class="item-name">
                                        <xsl:value-of select="name"/>
                                    </div>
                                    <div class="item-price">$                                        <xsl:value-of select="price"/>
                                        <small>(                                            <xsl:value-of select="price/@currency"/>
)</small>
                                    </div>
                                    <div class="item-description">
                                        <xsl:value-of select="description"/>
                                    </div>

                                    <div class="media-container">
                                        <img class="fabric-image">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="image"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="name"/>
                                            </xsl:attribute>
                                        </img>
                                        <br/>
                                        <audio controls="controls">
                                            <source>
                                                <xsl:attribute name="src">
                                                    <xsl:value-of select="sound"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="type">audio/mpeg</xsl:attribute>
                                            </source>
                                Your browser does not support the audio element.
                                        </audio>
                                    </div>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>