<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/Invoice">
        <html>
            <head>
                <title>Invoice Details</title>
                <style>
                    h1 { color: darkred; }
                    table { width: 100%; border-collapse: collapse; }
                    th, td { padding: 8px; text-align: left; border-bottom: 1px solid #ddd; }
                    .redtext { color: red; font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>Invoice Details</h1>
                <h2>Invoice Number: <xsl:value-of select="Header/InvoiceNumber"/></h2>
                <p><b>Date:</b> <xsl:value-of select="Header/Date"/></p>

                <h3>Seller Information</h3>
                <p><b>Name:</b> <xsl:value-of select="Header/Seller/Name"/></p>
                <p><b>Address:</b> <xsl:value-of select="Header/Seller/Address"/></p>
                <p><b>Phone:</b> <xsl:value-of select="Header/Seller/Phone"/></p>

                <h3>Customer Information</h3>
                <p><b>Name:</b> <xsl:value-of select="Customer/Name"/></p>
                <p><b>Address:</b> <xsl:value-of select="Customer/Address"/></p>
                <p><b>Phone:</b> <xsl:value-of select="Customer/Phone"/></p>
                <p><b>Email:</b> <xsl:value-of select="Customer/Email"/></p>
                <p><b>Loyalty Starting Year:</b> <xsl:value-of select="Customer/LoyaltyStartingYear"/></p>
                <p><b>Loyalty Points:</b> <xsl:value-of select="Customer/LoyaltyPoints"/></p>

                <h3>Invoice Items</h3>
                <table>
                    <tr>
                        <th>Item Description</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>VAT (%)</th>
                        <th>Discount (%)</th>
                        <th>Total</th>
                    </tr>
                    <xsl:for-each select="Items/Item">
                        <tr>
                            <td><xsl:value-of select="Description"/></td>
                            <td><xsl:value-of select="Quantity"/></td>
                            <td><xsl:value-of select="Price"/></td>
                            <td><xsl:value-of select="VAT"/></td>
                            <td><xsl:value-of select="Discount"/></td>
                            <td><xsl:value-of select="Total"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h3>Invoice Extra Details</h3>
                <p><b>Issue Date:</b> <xsl:value-of select="InvoiceExtraDetails/IssueDate"/></p>
                <p><b>Due Date:</b> <xsl:value-of select="InvoiceExtraDetails/DueDate"/></p>
                <p><b>Store ID:</b> <xsl:value-of select="InvoiceExtraDetails/IdStore"/></p>
                <p><b>Code Month:</b> <xsl:value-of select="InvoiceExtraDetails/CodeMonth"/></p>
                <p><b>Code Year:</b> <xsl:value-of select="InvoiceExtraDetails/CodeYear"/></p>
                <p><b>Total Amount:</b> <xsl:value-of select="InvoiceExtraDetails/TotalAmount"/></p>
                <p><b>Total VAT:</b> <xsl:value-of select="InvoiceExtraDetails/TotalVAT"/></p>
                <p><b>Total Discount:</b> <xsl:value-of select="InvoiceExtraDetails/TotalDiscount"/></p>
                <p class="redtext"><b>Total to Pay:</b> <xsl:value-of select="InvoiceExtraDetails/TotalToPay"/></p>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
