<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Протокол контроля МХ ПР по поверочной установке</title>
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
        
        <div align="center">ПРОТОКОЛ № <xsl:value-of select="PbmmCheck/DataHeader/ProtN"/></div>
        <div align="center">контроля МХ ПР по поверочной установке</div>
        <br/>
        
        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения КМХ: <xsl:value-of select="PbmmCheck/DataHeader/Place"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="10%">ПР: Датчик: Тип:</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="15%">
                <xsl:value-of select="PbmmCheck/DataHeader/Len_Num"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="10%">ПР: Преоб.: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/CurFM_NamTr1"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/CurFM_Num1"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="10%">ТПУ: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/TPU_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/TPU_Num"/>
              </td>
              <td align="right" width="15%">Дата поверки:</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/TPU_PrDate"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="10%">ПП: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/PP_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/PP_Num"/>
              </td>
            </tr>
           
		   <tr>
              <td align="left" width="10%">ИВК: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/IVK_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmCheck/DataHeader/IVK_Num"/>
              </td>
            </tr>
            <tr height="25%">
              <td align="left" width="25%" >
                Рабочая жидкость: <xsl:value-of select="PbmmCheck/DataHeader/Prod_Name"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="77%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - исходные данные</caption>
          <thead>
            <tr>
              <td align="center" width="11%">Детекторы</td>
              <td align="center" width="11%">
                V<sub>0</sub>,м<sup>3</sup>
              </td>
              <td align="center" width="11%">D, мм</td>
              <td align="center" width="11%">S, мм</td>
              <td align="center" width="11%">E, МПа</td>
              <td align="center" width="11%">
                α<sub>t доп</sub>,<br/>1/ºC
              </td>
              <td align="center" width="11%">
                K<sub>ПМ</sub>,<br/>имп/т
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
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="PbmmCheck/DataTab1">
              <tr>
                <td align="center">
                  <xsl:value-of select="DtNam"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Vo"/>
                </td>
                <td align="center">
                  <xsl:value-of select="D"/>
                </td>
                <td align="center">
                  <xsl:value-of select="S"/>
                </td>
                <td align="center">
                  <xsl:value-of select="E"/>
                </td>
                <td align="center">
                  <xsl:value-of select="A"/>
                </td>
                <td align="center">
                  <xsl:value-of select="MCf"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 2 - Результаты измерений и вычислений</caption>
          <thead>
            <tr>
              <td align="center">
                №точ/<br/>№изм
              </td>
              <td align="center">
                Q<sub>ji</sub>,<br/>т/ч
              </td>
              <td align="center">
                Детекторы
              </td>
              <td align="center">
                T<sub>ji</sub>,<br/>c
              </td>
              <td align="center">
                t<sub>ПУji</sub>,<br/>ºC
              </td>
              <td align="center">
                P<sub>ПУji</sub>,<br/>МПа
              </td>
              <td align="center">
                ρ<sub>ППji</sub>,<br/>кг/м<sup>3</sup>
              </td>
              <td align="center">
                t<sub>ППji</sub>,<br/>ºC
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1 </td>
              <td align="center" width="11%">2 </td>
              <td align="center" width="11%">3</td>
              <td align="center" width="11%">4</td>
              <td align="center" width="11%">5</td>
              <td align="center" width="11%">6</td>
              <td align="center" width="11%">7</td>
              <td align="center" width="11%">8</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="PbmmCheck/DataTab2">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="DtNam"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tdd"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Db"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tb"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="66%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 2</caption>
          <thead>
            <tr>
              <td align="center">
                №точ/<br/>№изм
              </td>
              <td align="center">
                P<sub>ППjiк</sub>,<br/>МПа
              </td>
              <td align="center">
                N<sub>ji</sub>,<br/>имп
              </td>
              <td align="center">
                M<sub>ПУji</sub>,<br/>т
              </td>
              <td align="center">
                M<sub>ji</sub>,<br/>т
              </td>
              <td align="center">
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
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="PbmmCheck/DataTab22">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ndd"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Mp"/>
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
          Заключение: δmax =&#160;<xsl:value-of select="PbmmCheck/DataHeader/PB_dKmax"/> %. ПР годен к дальнейшей эксплуатации (не годен и подлежит внеочередной поверке)
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
          Дата проведения поверки:&#160;<xsl:value-of select="PbmmCheck/DataHeader/STime"/>
        </div>
      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>
