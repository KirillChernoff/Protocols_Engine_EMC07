<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Протокол определения коэффициента преобразования СРМ с помощью ПУ и ПП по МИ 3312-2011 </title>
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
          ПРОТОКОЛ № <xsl:value-of select="PbmmKmsg/DataHeader/ProtN"/>
        </div>
        <div align="center">
          определения коэффициента преобразования СРМ <br/>
          с помощью ПУ и ПП по МИ 3312-2011
        </div>
        <br/>
        
        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения калибровки: <xsl:value-of select="PbmmKmsg/DataHeader/Place"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="10%">СРМ: Датчик: Тип:</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/Len_Num"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="10%">СРМ: Преоб.: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/CurFM_NamTr1"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/CurFM_Num1"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="10%">ПУ: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/TPU_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/TPU_Num"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="10%">ПП: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/PP_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/PP_Num"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="10%">ИВК: Тип: </td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/IVK_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="PbmmKmsg/DataHeader/IVK_Num"/>
              </td>
            </tr>
			
            <tr>
              <td align="left" width="25%" >
                Рабочая жидкость: <xsl:value-of select="PbmmKmsg/DataHeader/Prod_Name"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - исходные данные</caption>
          <thead>
            <tr>
              <td align="center" width="11%">Детекторы</td>
              <td align="center" width="11%">
                V<sub>0</sub>, м<sup>3</sup>
              </td>
              <td align="center" width="11%">D, мм</td>
              <td align="center" width="11%">S, мм</td>
              <td align="center" width="11%">E, МПа</td>
              <td align="center" width="11%">
                α<sub>t доп</sub>,<br/>1/ºC
              </td>
              <td align="center" width="11%">
                θ<sub>ΣO</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                θ<sub>VO</sub>,<br/>%
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
            <xsl:for-each select="PbmmKmsg/DataTab1">
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
                  <xsl:value-of select="SOo"/>
                </td>
                <td align="center">
                  <xsl:value-of select="OVo"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="55%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 1</caption>
          <thead>
            <tr>
              <td align="center" width="11%">
                Δt<sub>ПУ</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                Δt<sub>ПП</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                Δρ<sub>ПП</sub>,<br/>кг/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                δ<sub>ИВК</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                Z<sub>Sk</sub>,<br/>т/ч
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">9</td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="PbmmKmsg/DataTab12">
              <tr>
                <td align="center">
                  <xsl:value-of select="dTp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dTb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dDb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dKv"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Zsk"/>
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
                Q<sub>jik</sub>,<br/>т/ч
              </td>
              <td align="center">
                Детекторы
              </td>
              <td align="center">
                T<sub>jik</sub>,<br/>c
              </td>
              <td align="center">
                t<sub>ПУjik</sub>,<br/>ºC
              </td>
              <td align="center">
                P<sub>ПУjik</sub>,<br/>МПа
              </td>
              <td align="center">
                ρ<sub>ППjik</sub>,<br/>кг/м<sup>3</sup>
              </td>
              <td align="center">
                t<sub>ППjik</sub>,<br/>ºC
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
            <xsl:for-each select="PbmmKmsg/DataTab2">
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
                №пд/<br/>№изм
              </td>
              <td align="center">
                P<sub>ППjiк</sub>,<br/>МПа
              </td>
              <td align="center">
                β<sub>jik</sub>,<br/>1/ºC
              </td>
              <td align="center">
                N<sub>jik</sub>,<br/>имп
              </td>
              <td align="center">
                M<sub>ПУjik</sub>,<br/>т
              </td>
              <td align="center">
                K<sub>ПМjik</sub>,<br/>имп/т
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1 </td>
              <td align="center" width="11%">9 </td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="PbmmKmsg/DataTab22">
              <tr>
                <td align="center">
                  <xsl:value-of select="ji"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pb"/>
                </td>
                <td align="center">
                  <xsl:value-of select="b"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ndd"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Mp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kpm"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="88%" bordercolor="#000000">
          <caption align="left" >Таблица 3 - Результаты измерений и вычислений в точках рабочего диапазона</caption>
          <thead>
            <tr>
              <td align="center">
                № точ.
              </td>
              <td align="center">
                Q<sub>jk</sub>,<br/>т/ч
              </td>
              <td align="center">
                K<sub>ПМjk</sub>,<br/>имп/т
              </td>
              <td align="center">
                n<sub>jk</sub>
              </td>
              <td align="center">
                S<sub>jk</sub>,<br/>%
              </td>
              <td align="center">
                S<sub>0jk</sub>,<br/>%
              </td>
              <td align="center">
                t<sub>0,95jk</sub>
              </td>
              <td align="center">
                ε<sub>jk</sub>,<br/>%
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
            <xsl:for-each select="PbmmKmsg/DataTab3">
              <tr>
                <td align="center">
                  <xsl:value-of select="j"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Kpm"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Nm"/>
                </td>
                <td align="center">
                  <xsl:value-of select="S"/>
                </td>
                <td align="center">
                  <xsl:value-of select="So"/>
                </td>
                <td align="center">
                  <xsl:value-of select="t095"/>
                </td>
                <td align="center">
                  <xsl:value-of select="e"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="77%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 3</caption>
          <thead>
            <tr>
              <td align="center">
                № точ.
              </td>
              <td align="center">
                θ<sub>tk</sub>,<br/>%
              </td>
              <td align="center">
                θ<sub>Pk</sub>,<br/>%
              </td>
              <td align="center">
                θ<sub>zjk</sub>,<br/>%
              </td>
              <td align="center">
                θ<sub>sjk</sub>,<br/>%
              </td>
              <td align="center">
                Δ<sub>jk</sub>,<br/>%
              </td>
              <td align="center">
                Δ<sub>k</sub>, <br/>%
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
            <xsl:for-each select="PbmmKmsg/DataTab31">
              <tr>
                <td align="center">
                  <xsl:value-of select="j"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ot"/>
                </td>
                <td align="center">
                  <xsl:value-of select="OD"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Ozk"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Osk"/>
                </td>
                <td align="center">
                  <xsl:value-of select="djk"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dk"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table>
          <tbody>
            <tr>
              <td align="left" width="60%">
                Подпись лица, проводившего измерения
              </td>
              <td width="19%">
                ____________________________
              </td>
              <td align="center" width="2%">
                /
              </td>
              <td width="19%">
                ____________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center" valign="top">
                (подпись)
              </td>
              <td>

              </td>
              <td align="center" valign="top">
                И.О. Фамилия
              </td>
            </tr>
          </tbody>
        </table>

        <br/>
        <div>
          Дата:&#160;<xsl:value-of select="PbmmKmsg/DataHeader/STime"/>
        </div>

      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>
