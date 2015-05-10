<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Протокол контроля МХ СРМ с помощью ЭПР и ПП</title>
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

        <div align="center">
          ПРОТОКОЛ № <xsl:value-of select="EvmmmCheckE/DataHeader/ProtN"/>
        </div>
        <div align="center">контроля МХ СРМ с помощью ЭПР и ПП</div>
        <br/>
        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения поверки: <xsl:value-of select="EvmmmCheckE/DataHeader/Place"/>
              </td>
            </tr>
            <tr height="25">
              <td align="left" width="5%">СРМ:</td>
              <td align="left" width="10%">Тип датчика:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmCheckE/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmCheckE/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmCheckE/DataHeader/Len_Num"/>
              </td>
            </tr>

            <tr height="25">
              <td align="left" width="5%"> </td>
              <td align="left" width="10%">Тип преобразавателя:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmCheckE/DataHeader/CurFM_NamTr1"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmCheckE/DataHeader/CurFM_Num1"/>
              </td>

            </tr>

            <tr height="25">
              <td align="left" width="5%"> </td>
              <td align="left" width="20%" colspan="3">
                Kпм, имп/т =&#160;<xsl:value-of select="EvmmmCheckE/DataHeader/CurFM_Mcf"/>
              </td>
            </tr>

            <tr height="25">
              <td align="left" width="5%">ЭПР</td>
              <td align="left" width="10%"></td>
              <td align="left" width="20%">
                Тип:&#160;
                <xsl:value-of select="EvmmmCheckE/DataHeader/EFM_NamTr"/>
              </td>
              <td align="right" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmCheckE/DataHeader/EFM_Num"/>
              </td>
            </tr>

            <tr height="25">
              <td align="left" width="5%">ПП</td>
              <td align="left" width="10%"></td>
              <td align="left" width="20%">
                Тип:&#160;
                <xsl:value-of select="EvmmmCheckE/DataHeader/PP_NamTr"/>
              </td>
              <td align="right" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmCheckE/DataHeader/PP_Num"/>
              </td>
            </tr>

            <tr height="25">
              <td align="left" width="5%">ИВК</td>
              <td align="left" width="10%"></td>
              <td align="left" width="20%">
                Тип:&#160;
                <xsl:value-of select="EvmmmCheckE/DataHeader/IVK_NamTr"/>
              </td>
              <td align="right" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmCheckE/DataHeader/IVK_Num"/>
              </td>
            </tr>

            <tr height="25">
              <td align="left" width="50%" colspan="5">
                Рабочая жидкость:&#160;<xsl:value-of select="EvmmmCheckE/DataHeader/Prod_Name"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="100%" bordercolor="#000000">
          <caption align="left" >Таблица 1 -Результаты измерений и вычислений</caption>
          <thead>
            <tr>
              <td align="center" width="12%">
                №точ/<br/>№изм
              </td>
              <td align="center" width="11%">
                Q<sub>ji</sub>,<br/>т/ч
              </td>
              <td align="center" width="11%">
                T<sub>ji</sub>,<br/>c
              </td>
              <td align="center" width="11%">
                t<sub>КПРji</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                P<sub>КПРji</sub>,<br/>МПа
              </td>
              <td align="center" width="11%">
                K<sub>КПРji</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                N<sub>КПРji</sub>,<br/>имп
              </td>
              <td align="center" width="11%">
                ρ<sub>ППji</sub>,<br/>кг/м<sup>3</sup>
              </td>
            </tr>
            <tr>
              <td align="center" width="12%">1</td>
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
            <xsl:for-each select="EvmmmCheckE/DataTab1">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="MTime"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Te"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pe"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kvec"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ne"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Db"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="100%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 1</caption>
          <thead>
            <tr>
              <td align="center" width="12%">
                №точ/<br/>№изм
              </td>
              <td align="center" width="11%">
                t<sub>ППji</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                P<sub>ППji</sub>,<br/>МПа
              </td>
              <td align="center" width="11%">
                N<sub>ПРji</sub>,<br/>имп
              </td>
              <td align="center" width="11%">
                M<sub>КПРji</sub>,<br/>т
              </td>
              <td align="center" width="11%">
                M<sub>ПРji</sub>,<br/>т
              </td>
              <td align="center" width="11%">
                δ<sub>ji</sub>,<br/>%
              </td>
            </tr>

            <tr>
              <td align="center" width="11%">1</td>
              <td align="center" width="11%">9</td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmmmCheckE/DataTab12">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Nt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Me"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Mt"/>
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
          Заключение: δmax =&#160;<xsl:value-of select="EvmmmCheckE/DataHeader/EVMMM_dMmax"/>%. ПР к дальнейшей эксплуатации (годен, не годен и подлежит внеочередной поверке)
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
          Дата проведения поверки:&#160;<xsl:value-of select="EvmmmCheckE/DataHeader/STime"/>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
