<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="windows-1251" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">

      <head>
        <meta charset="utf-8"/>
        <title>Поверка СРМ с помощью ЭСРМ по МИ 3313-2011</title>
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
        <div align="center">ПРОТОКОЛ № <xsl:value-of select="EvmmmVerificationMf/DataHeader/ProtN"/></div>
        <div align="center">поверки СРМ с помощью ЭСРМ по МИ 3313-2011</div>
        <br/>

        <table style="table-layout:auto;" border="0" cellpadding="2" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td align="left" colspan="6" width="100%">
                Место проведения поверки: <xsl:value-of select="EvmmmVerificationMf/DataHeader/Place"/>
              </td>
            </tr>
            <tr height="25">
              <td align="left" width="5%"> СРМ</td>
              <td align="left" width="10%">Тип датчика:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/CurFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/CurFM_Num"/>
              </td>
              <td align="right" width="15%">Линия №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/Len_Num"/>
              </td>
            </tr>
            <tr height="25">
              <td align="left" width="5%"> </td>
              <td align="left" width="20%">Тип преобразавателя:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/CurFM_NamTr1"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/CurFM_Num1"/>
              </td>
            </tr>
            <tr height="25">
              <td align="left" width="5%">ЭПР</td>
              <td align="left" width="20%">Тип:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/EFM_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/EFM_Num"/>
              </td>
            </tr>
            <tr height="25">
              <td align="left" width="5%">ПП</td>
              <td align="left" width="20%">Тип:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/PP_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/PP_Num"/>
              </td>
            </tr>
            <tr height="25">
              <td align="left" width="5%"> ИВК</td>
              <td align="left" width="20%">Тип:</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/IVK_NamTr"/>
              </td>
              <td align="left" width="15%">Заводской №</td>
              <td align="left" width="20%">
                <xsl:value-of select="EvmmmVerificationMf/DataHeader/IVK_Num"/>
              </td>
            </tr>
            <tr height="25">
              <td align="left" width="50%" colspan="5">
                Рабочая жидкость:&#160;<xsl:value-of select="EvmmmVerificationMf/DataHeader/Prod_Name"/>
              </td>
            </tr>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="100%" bordercolor="#000000">
          <caption align="left" >Таблица 1 - Исходные данные</caption>
          <thead>
            <tr>
              <td align="center" width="12%">
                δ<sub>Э</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                Δt<sub>Э</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                Δt<sub>ПП</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                ρ<sub>ПП</sub>,<br/>кг/м<sup>3</sup>
              </td>
              <td align="center" width="11%">
                δ<sub>ИВК</sub>,<br/>%
              </td>
              <td align="center" width="11%">
                K<sub>ПМ</sub>,<br/>имп/т
              </td>
              <td align="center" width="11%">
                MF<sub>уст</sub>
              </td>
              <td align="center" width="11%">
                Q<sub>Мmax</sub>,<br/>т/ч
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
            <xsl:for-each select="EvmmmVerificationMf/DataTab1">
              <tr>
                <td align="center">
                  <xsl:value-of select="de"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dte"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dtpp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dDpp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dIvk"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Mcf"/>
                </td>
                <td align="center">
                  <xsl:value-of select="MF"/>
                </td>
                <td align="center">
                  <xsl:value-of select="QMax"/>
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
              <td align="center" width="11%">
                ZS,<br/>т/ч
              </td>
              <td align="center" width="11%">
                Q<sub>НОМ</sub>,<br/>т/ч
              </td>
              <td align="center" width="11%">
                δ<sub>tдоп</sub>,<br/>%/ºC
              </td>
              <td align="center" width="11%">
                δ<sub>Pдоп</sub>,<br/>%/0,1МПа
              </td>
              <td align="center" width="11%">
                t<sub>min</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                t<sub>max</sub>,<br/>ºC
              </td>
              <td align="center" width="11%">
                P<sub>min</sub>,<br/>МПа
              </td>
              <td align="center" width="11%">
                P<sub>max</sub>,<br/>МПа
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">9</td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
              <td align="center" width="11%">15</td>
              <td align="center" width="11%">16</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmmmVerificationMf/DataTab12">
              <tr>
                <td align="center">
                  <xsl:value-of select="ZS"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qnom"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="dp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="tmin"/>
                </td>
                <td align="center">
                  <xsl:value-of select="tmax"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pmin"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pmax"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>
        
        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="100%" bordercolor="#000000">
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
                T<sub>ji</sub>,<br/>c
              </td>
              <td align="center">
                t<sub>Эji</sub>,<br/>ºC
              </td>
              <td align="center">
                P<sub>Эji</sub>,<br/>МПа
              </td>
              <td align="center">
                K<sub>Эji</sub>,<br/>имп/м<sup>3</sup>
              </td>
              <td align="center">
                N<sub>Эji</sub>,<br/>имп
              </td>
              <td align="center">
                ρ<sub>ППji</sub>,<br/>кг/м<sup>3</sup>
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1 </td>
              <td align="center" width="11%">2 </td>
              <td align="center" width="11%">3 </td>
              <td align="center" width="11%">4 </td>
              <td align="center" width="11%">5 </td>
              <td align="center" width="11%">6 </td>
              <td align="center" width="11%">7 </td>
              <td align="center" width="11%">8 </td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmmmVerificationMf/DataTab2">
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
          <caption align="left" >Окончание таблицы 2</caption>
          <thead>
            <tr>
              <td align="center"  >
                №точ/<br/>№изм
              </td>
              <td align="center">
                t<sub>ППji</sub>,<br/>ºC
              </td>
              <td align="center">
                P<sub>ППji</sub>,<br/>МПа
              </td>
              <td align="center">
                β<sub>ji</sub>,<br/>1/ºC
              </td>
              <td align="center">
                N<sub>ji</sub>,<br/>имп
              </td>
              <td align="center">
                M<sub>Эji</sub>,<br/>т
              </td>
              <td align="center">
                M<sub>ji</sub>,<br/>т
              </td>
              <td align="center">
                MF<sub>ji</sub>
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">1 </td>
              <td align="center" width="11%">9 </td>
              <td align="center" width="11%">10</td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
              <td align="center" width="11%">15</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmmmVerificationMf/DataTab22">
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
                  <xsl:value-of select="b"/>
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
                  <xsl:value-of select="MF"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="100%" bordercolor="#000000">
          <caption align="left" >Таблица 3 - Результаты поверки в точках рабочего диапазона</caption>
          <thead>
            <tr>
              <td align="center">
                № точ.
              </td>
              <td align="center">
                Q<sub>j</sub>,<br/>т/ч
              </td>
              <td align="center">
                MF<sub>j</sub>
              </td>
              <td align="center">
                n <sub>j</sub>
              </td>
              <td align="center">
                S<sub>j</sub>,<br/>%
              </td>
              <td align="center">
                S<sub>0j</sub>,<br/>%
              </td>
              <td align="center">
                t<sub>0,95j</sub>
              </td>
              <td align="center">
                ε<sub>j</sub>,<br/>%
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
            <xsl:for-each select="EvmmmVerificationMf/DataTab3">
              <tr>
                <td align="center">
                  <xsl:value-of select="j"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Q"/>
                </td>
                <td align="center">
                  <xsl:value-of select="MF"/>
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

        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="100%" bordercolor="#000000">
          <caption align="left" >Таблица 4 - Результаты поверки в диапазоне</caption>
          <thead>
            <tr>
              <td align="center">
                Q<sub>min</sub>,<br/>т/ч
              </td>
              <td align="center">
                Q<sub>max</sub>,<br/>т/ч
              </td>
              <td align="center">
                MF
              </td>
              <td align="center">
                S<sub>0</sub>,<br/>%
              </td>
              <td align="center">
                ε,<br/>%
              </td>
              <td align="center">
                θ<sub>A</sub>,<br/>%
              </td>
              <td align="center">
                θ<sub>Z</sub>,<br/>%
              </td>
              <td align="center">
                θ<sub>ρ</sub>,<br/>%
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
            <xsl:for-each select="EvmmmVerificationMf/DataTab4">
              <tr>
                <td align="center">
                  <xsl:value-of select="Qmin"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Qmax"/>
                </td>
                <td align="center">
                  <xsl:value-of select="MF"/>
                </td>
                <td align="center">
                  <xsl:value-of select="So"/>
                </td>
                <td align="center">
                  <xsl:value-of select="e"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Oa"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Oz"/>
                </td>
                <td align="center">
                  <xsl:value-of select="OD"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>
        
        <table style="border-collapse:collapse;"  border="1" cellpadding="5" cellspacing="0" width="100%" bordercolor="#000000">
          <caption align="left" >Окончание таблицы 4</caption>
          <thead>
            <tr>
              <td align="center"  >
                θ<sub>t</sub>,<br/>%
              </td>
              <td align="center">
                t<sub>П</sub>,<br/>ºC
              </td>
              <td align="center">
                θ<sub>Mt</sub>,<br/>%
              </td>
              <td align="center">
                P<sub>П</sub>,<br/>МПа
              </td>
              <td align="center">
                θ<sub>MP</sub>,<br/>%
              </td>
              <td align="center">
                θ<sub>Σ</sub>,<br/>%
              </td>
              <td align="center">
                δ,<br/>%
              </td>
            </tr>
            <tr>
              <td align="center" width="11%">9 </td>
              <td align="center" width="11%">10 </td>
              <td align="center" width="11%">11</td>
              <td align="center" width="11%">12</td>
              <td align="center" width="11%">13</td>
              <td align="center" width="11%">14</td>
              <td align="center" width="11%">15</td>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="EvmmmVerificationMf/DataTab42">
              <tr>
                <td align="center">
                  <xsl:value-of select="Ot"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Tt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Omt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Pt"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Omp"/>
                </td>
                <td align="center">
                  <xsl:value-of select="Os"/>
                </td>
                <td align="center">
                  <xsl:value-of select="d"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>

        </table>
        <br/>

        <table>
          <tbody>
            <tr>
              <td align="left" width="50%">
                Заключение: СРМ к дальнейшей эксплуатации
              </td>
              <td align="center" width="30%">
                ____________________________
              </td>
            </tr>
            <tr>
              <td>

              </td>
              <td align="center">
                (годен, не годен)
              </td>
            </tr>
          </tbody>
        </table>

        <br/>
        <br/>

        <table>
          <tbody>
            <tr>
              <td align="left" width="60%">
                Подпись лица, проводившего поверку
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
          Дата проведения поверки:&#160;<xsl:value-of select="EvmmmVerificationMf/DataHeader/STime"/>
        </div>
      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>
