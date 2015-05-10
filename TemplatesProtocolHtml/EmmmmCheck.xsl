<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
      </head>

      <style type="text/css" media="print,screen" >

        h1 {
        font-family: Franklin Gothic Book;
        font-size: 9.5pt;
        }

        div {
        font-family: Franklin Gothic Book;
        font-size: 9.5pt;
        }

        caption {
        align:left;
        font-family: Franklin Gothic Book;
        font-size: 9.5pt;
        }

        table
        th {
        font-family:Franklin Gothic Book;
        font-size: 9.5pt;
        font-style: normal;
        }
        tr
        {
        font-family:Franklin Gothic Book;
        font-size: 9.5pt;
        page-break-inside: avoid;
        }
        td
        {
        font-family:Franklin Gothic Book;
        font-size: 9.5pt;
        }
        thead {
        display:table-header-group;
        bgcolor:white;
        }
        tbody {
        display:table-row-group;
        }
        }

        #Footer, #Header
        {
        display: none;
        }

      </style>

      <body scroll="no" >
        <div align="center">ПРОТОКОЛ № <xsl:value-of select="EmmmmCheck/DataHeader/ProtN"/></div>
        <div align="center"><xsl:value-of select="EmmmmCheck/DataHeader/TypeProtocol"/></div>
        <br/>
        
        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения поверки: <xsl:value-of select="EmmmmCheck/DataHeader/Place"/>
              </td>
            </tr>
            <tr>
              <td align="left" width="5%">
                <xsl:value-of select="EmmmmCheck/DataHeader/CurFM_Type"/>
              </td>
              <td align="left" width="20%">Тип датчика:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EmmmmCheck/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmCheck/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="10%">
                <xsl:value-of select="EmmmmCheck/DataHeader/CurFM_Len_Num"/>
              </td>
            </tr>

            <tr>
              <td align="left" width="5%"> </td>
              <td align="left" width="20%">Тип преобразавателя:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EmmmmCheck/DataHeader/CurFM_NamTr1"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmCheck/DataHeader/CurFM_Num1"/>
              </td>
            </tr>

            <tr>
              <td align="left" width="5%"> </td>
              <td align="left" width="20%" colspan="4">Kпм, имп/т =&#160;<xsl:value-of select="EmmmmCheck/DataHeader/CurFM_Mcf"/></td>
            </tr>

            <tr>
              <td align="left" width="5%">
                <xsl:value-of select="EmmmmCheck/DataHeader/EFM_Type"/>
              </td>
              <td align="left" width="20%">Тип датчика:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EmmmmCheck/DataHeader/EFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmCheck/DataHeader/EFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="10%">
                <xsl:value-of select="EmmmmCheck/DataHeader/EFM_Len_Num"/>
              </td>
            </tr>

            <tr>
              <td align="left" width="5%"> </td>
              <td align="left" width="20%">Тип преобразавателя:</td>
              <td align="left" width="15%">
                <xsl:value-of select="EmmmmCheck/DataHeader/EFM_NamTr1"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmCheck/DataHeader/EFM_Num1"/>
              </td>
            </tr>

            <tr>
              <td align="left" width="5%"> </td>
              <td align="left" width="20%" colspan="2">
                Kпм, имп/т =&#160;<xsl:value-of select="EmmmmCheck/DataHeader/EFM_Mcf"/>
              </td>
              <td align="left" width="15%">Дата поверки:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EmmmmCheck/DataHeader/EFM_PrDate"/>
              </td>			  
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - Результаты измерений и вычислений</caption>
          <thead>
            <tr>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EmmmmCheck/DataHeader/Tab1Header1"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EmmmmCheck/DataHeader/Tab1Header2"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EmmmmCheck/DataHeader/Tab1Header3"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EmmmmCheck/DataHeader/Tab1Header4"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EmmmmCheck/DataHeader/Tab1Header5"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EmmmmCheck/DataHeader/Tab1Header6"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EmmmmCheck/DataHeader/Tab1Header7"/>
              </td>
              <td align="center" width="11%">
                <xsl:value-of disable-output-escaping="yes" select="EmmmmCheck/DataHeader/Tab1Header8"/>
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1</td>
              <td align="center" width="11%">2</td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">6</td>
              <td align="center" width="11%">7</td>
              <td align="center" width="11%">8</td>

            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EmmmmCheck/DataTab1">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Neji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ntji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Meji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Mtji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dM"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>

        <br/>

        <div>
          Заключение: δmax =&#160;<xsl:value-of select="EmmmmCheck/DataHeader/EMMMM_dMmax"/>%. ПР годен к дальнейшей эксплуатации (не годен и подлежит внеочередной поверке)
        </div>
        <br/>
        <div>
          Подпись лиц, проводивших КМХ:
        </div>

        <table>
          <tbody>
            <tr>
              <td align="left" width="60%">
                От сервисной организации
              </td>
              <td width="40%">
                ____________________________________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center" valign="top">
                (должность, фамилия, инициалы, подпись)
              </td>
            </tr>
          </tbody>
        </table>
        <br/>
        <table>
          <tbody>
            <tr>
              <td align="left" width="60%">
                От сдающей стороны
              </td>
              <td width="40%">
                ____________________________________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center" valign="top">
                (должность, фамилия, инициалы, подпись)
              </td>
            </tr>
          </tbody>
        </table>
        <br/>
        <table>
          <tbody>
            <tr>
              <td align="left" width="60%">
                От принимающей стороны
              </td>
              <td width="40%">
                ____________________________________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center" valign="top">
                (должность, фамилия, инициалы, подпись)
              </td>
            </tr>
          </tbody>
        </table>
        <br/>
        <div>
          Дата проведения поверки:&#160;<xsl:value-of select="EmmmmCheck/DataHeader/STime"/>
        </div>
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
