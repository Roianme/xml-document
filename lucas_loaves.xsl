<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy-compat" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Luca's Loaves - Artisan Bakery</title>
                <style>
        body {
            font-family: 'Georgia', serif;
            background-color: #fdf6e3;
            color: #5c3317;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }
        .product {
            background-color: #fff;
            margin: 20px 0;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-left: 5px solid #d2a679;
        }
        .product-name {
            font-size: 1.8em;
            font-weight: bold;
            color: #b3541e;
            margin-bottom: 5px;
        }
        .product-price {
            font-size: 1.4em;
            color: #38761d;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .product-description {
            font-style: italic;
            margin: 10px 0;
            line-height: 1.5;
        }
        .media-container {
            margin: 15px 0;
            text-align: center;
        }
        .bread-image {
            max-width: 300px;
            border-radius: 5px;
        }
        audio {
            margin-top: 10px;
            width: 100%;
            max-width: 300px;
        }
                </style>
            </head>
            <body>
                <h1>Luca's Loaves</h1>
                <h2>Artisan Sourdough Breads</h2>

                <xsl:for-each select="lucas_loaves/product">
                    <div class="product">
                        <div class="product-name">
                            <xsl:value-of select="name"/>
                        </div>
                        <div class="product-price">$                            <xsl:value-of select="price"/>
                            <small>(                                <xsl:value-of select="price/@currency"/>
)</small>
                        </div>
                        <div class="product-description">
                            <xsl:value-of select="description"/>
                        </div>

                        <div class="media-container">
                            <img class="bread-image">
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
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>