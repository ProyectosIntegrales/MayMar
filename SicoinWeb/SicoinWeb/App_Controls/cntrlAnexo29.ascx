<%@ Control Language="VB" AutoEventWireup="false" CodeFile="cntrlAnexo29.ascx.vb" Inherits="App_Controls_cntrlAnexo29" %>
<%@ Register Src="~/cntrlError.ascx" TagPrefix="uc1" TagName="cntrlError" %>


<%@ Register Src="cntrlRepAnexo29.ascx" TagName="cntrlRepAnexo29" TagPrefix="uc2" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Src="cntrlRepAnexo29XLS.ascx" TagName="cntrlRepAnexo29XLS" TagPrefix="uc3" %>

<script type="text/javascript">

</script>

<style>
    .ajax__combobox_itemlist {
        position: fixed !important;
        height: 150px !important;
        overflow-y: scroll !important;
        width: 115px !important;
    }

    .ajax__combobox_textboxcontainer input {
        font-family: Verdana, Geneva, sans-serif;
        font-size: 12px;
        border-radius: 3px !important;
        color: #444444;
        border: solid 1px #bdbdbd !important;
        padding: 2px;
        padding-left: 5px;
        padding-right: 5px;
        width: 105px;
    }

    .ajax__combobox_buttoncontainer button {
        font-size: .9em;
        padding: 0px;
        width: 120px;
        border-radius: 1px 1px 0 0;
        text-align: center;
        border: 1px solid #b7d3ff;
        color: #134680;
        -moz-border-radius: 1px 1px 0 0;
        -webkit-border-radius: 1px 1px 0 0;
        background-position: center;
        background-repeat: no-repeat;
        background-color: #d1dcef;
        width: 16px !important;
        height: 12px !important;
        left: -20px !important;
        position: relative;
    }

    .ajax__combobox_inputcontainer {
        top: -2px !important;
    }

    ul {
        left: 187px;
        top: 446px;
        width: 791px;
        display: block;
        z-index: 1000;
        height: 100px !important;
    }
</style>

<asp:Panel ID="pnlMain" runat="server">


    <div class="container" style="padding-bottom: 20px; padding-top: 10px;">
        <div class="itemLabel" style="padding-top: 6px;">Tipo de registro:</div>
        <div style="padding-right: 50px; white-space: nowrap;">
            <asp:RadioButtonList ID="rblOp" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" RepeatLayout="Flow">
                <asp:ListItem Text="Nuevo" Value="N" style="padding-right: 10px;"></asp:ListItem>
                <asp:ListItem Text="Adicional" Value="A" style="padding-right: 10px;"></asp:ListItem>
                <asp:ListItem Text="Extraordinario" Value="X" style="padding-right: 30px;"></asp:ListItem>
                <asp:ListItem Text="Modificar folio existente" Value="U" style="padding-right: 20px;"></asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <div class="itemLabel" style="padding-top: 6px; width: 40%;">
            <asp:Label ID="lblFolio" runat="server" Text="Folio:" Visible="false"></asp:Label></div>
        <div style="padding-top: 5px;">
            <asp:TextBox ID="txtFolio" runat="server" CssClass="textboxg uppercase" Width="105" TabIndex="50" Visible="false" AutoPostBack="True"></asp:TextBox>
            <ajaxToolkit:ComboBox ID="ddlFolios" runat="server" AutoCompleteMode="Append" AutoPostBack="True" DataSourceID="dsFolios" DataTextField="FolioAdicional" DataValueField="FolioAdicional" MaxLength="10" DropDownStyle="DropDownList">
            </ajaxToolkit:ComboBox>
            <asp:DropDownList ID="ddlFoliosX" runat="server" CssClass="textboxg uppercase" DataSourceID="dsFolios" DataTextField="FolioAdicional" DataValueField="FolioAdicional" Visible="False" Style="width: 130px;" AutoPostBack="True" CausesValidation="false"></asp:DropDownList>
            <asp:SqlDataSource ID="dsFolios" runat="server" ConnectionString="<%$ ConnectionStrings:MaymarCS %>" SelectCommand="SELECT [FolioAdicional] FROM [vFolioAdicional] ORDER BY [FolioNumero] DESC"></asp:SqlDataSource>
            <asp:Label ID="lblError" runat="server" Style="font-size: 9px; color: Red; padding-top: 5px; margin-bottom: 10px;"></asp:Label>
        </div>

    </div>

    <div style="position: absolute; top: 5px; right: 25px;">
        <asp:LinkButton ID="lnbReporte" runat="server" Text="Reporte"></asp:LinkButton>
    </div>
    <asp:Panel ID="pnlData" runat="server" Visible="False">
        <asp:Panel ID="pnlFields" runat="server">


            <div class="container" style="flex: 1; white-space: nowrap">

                <br />
                <div style="width: 30%; display: inline-block; text-align: left; left: 0px; align-content: flex-start">
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="Marcar como cancelado" /></div>

                <div style="padding-right: 10px; width: 70%; display: inline-block; text-align: right">
                    Fecha:&nbsp;
        <asp:TextBox ID="txtDate" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="50" Width="90px"></asp:TextBox>
                </div>
            </div>
            <div class="container">
                <div class="tableHead">
                    Mercancía
                </div>
            </div>
            <div class="container">
                <div class="itemLabel">Descripción:</div>

                <div style="text-align: left; width: 100%;">
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="textboxg uppercase" Width="98%" onkeydown="nextOnEnter(this,event);" TabIndex="100"></asp:TextBox>
                </div>
            </div>
            <div class="container">
                <div class="itemLabel" style="padding-left: 13px;">Peso neto:</div>
                <div>
                    <asp:TextBox ID="txtPesoNeto" runat="server" CssClass="textboxg" Width="80" onkeydown="nextOnEnter(this,event);" TabIndex="101" Style="text-align: right;"></asp:TextBox>
                </div>
                <div class="itemLabel" style="padding-left: 23px;">Régimen:</div>
                <div>
                    <asp:TextBox ID="txtRegimen" runat="server" CssClass="textboxg uppercase" Width="60" onkeydown="nextOnEnter(this,event);" TabIndex="102"></asp:TextBox>
                </div>
                <div class="itemLabel" style="padding-left: 13px; width: 44%">No. de Pedimento, Factura o Lista de Empaque:</div>
                <div>
                    <asp:TextBox ID="txtDocumento" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="103"></asp:TextBox>
                </div>
            </div>
            <div class="container" style="flex-wrap: nowrap;">
                <div class="itemLabel" style="text-wrap: none; word-wrap: hyphenate; width: 240px;">Motivo de ingreso a Recinto Fiscal:</div>
                <div style="width: 80%">
                    <asp:TextBox ID="txtMotivo" runat="server" CssClass="textboxg uppercase" Width="98%" onkeydown="nextOnEnter(this,event);" TabIndex="104"></asp:TextBox>
                </div>
            </div>

            <div class="container">
                <div class="tableHead">Contenedor</div>
            </div>
            <div class="container">
                <div class="itemLabel">No. de Contenedor:</div>
                <div>
                    <asp:TextBox ID="txtNoContenedor" runat="server" CssClass="textboxg uppercase" Width="60" onkeydown="nextOnEnter(this,event);" TabIndex="105"></asp:TextBox>
                </div>
                <div class="itemLabel" style="padding-left: 23px;">Medida:</div>
                <div>
                    <asp:TextBox ID="txtMedida" runat="server" CssClass="textboxg uppercase" Width="100" onkeydown="nextOnEnter(this,event);" TabIndex="106"></asp:TextBox>
                </div>
                <div class="itemLabel" style="padding-left: 23px;">Tipo:</div>
                <div>
                    <asp:TextBox ID="txtTipo" runat="server" CssClass="textboxg uppercase" Width="100" onkeydown="nextOnEnter(this,event);" TabIndex="107"></asp:TextBox>
                </div>
                <div class="itemLabel" style="padding-left: 40px;">Sellos fiscales:</div>
                <div>
                    <asp:TextBox ID="txtSellos" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="108" Width="100%"></asp:TextBox>
                </div>
            </div>

            <div class="container">
                <div class="tableHead">Exportador</div>
            </div>
            <div class="container">
                <div class="itemLabel">Nombre:</div>
                <div id="Nombre" style="width: 100%">
                    <asp:HiddenField ID="hflID" runat="server" />
                    <asp:TextBox ID="txtNombreExp" runat="server" CssClass="textboxg uppercase" Width="98%" onkeydown="nextOnEnter(this,event);" TabIndex="110" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>
            <div class="container">
                <div class="itemLabel">Dirección:</div>
                <div style="width: 100%">
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="textboxg uppercase" Width="98%" onkeydown="nextOnEnter(this,event);" TabIndex="111" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>
            <div class="container">
                <div class="itemLabel">Ciudad:</div>
                <div>
                    <asp:TextBox ID="txtCiudad" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="112" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="itemLabel" style="padding-left: 33px;">R. F. C.:</div>
                <div>
                    <asp:TextBox ID="txtRFC" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="113" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>

            <div class="container">
                <div class="tableHead">Datos del medio de transporte de Salida</div>
            </div>
            <div class="container">
                <div class="itemLabel">Nombre o razon Social:</div>
                <div style="width: 100%">
                    <asp:TextBox ID="txtNombreTrns" runat="server" CssClass="textboxg uppercase" Width="98%" onkeydown="nextOnEnter(this,event);" TabIndex="114"></asp:TextBox></div>
            </div>
            <div class="container">
                <div class="itemLabel">Placas:</div>
                <div>
                    <asp:TextBox ID="txtPlacas" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="115"></asp:TextBox></div>
                <div class="itemLabel" style="padding-left: 13px; width: 100%">No. Economico:</div>
                <div>
                    <asp:TextBox ID="txtNumEconomico" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="116"></asp:TextBox></div>
                <div class="itemLabel" style="padding-left: 13px; width: 100%">CAAT:</div>
                <div>
                    <asp:TextBox ID="txtCAAT" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="117"></asp:TextBox></div>
            </div>

            <div class="container">
                <div class="itemLabel">Nombre del operador:</div>
                <div style="width: 70%">
                    <asp:TextBox ID="txtNombreOper" runat="server" CssClass="textboxg uppercase" Width="98%" onkeydown="nextOnEnter(this,event);" TabIndex="118"></asp:TextBox></div>
                <div class="itemLabel" style="padding-left: 13px; width: 25%">No. de Licencia:</div>
                <div>
                    <asp:TextBox ID="txtNoLicencia" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="119"></asp:TextBox></div>
            </div>
            <div class="container">
                <div class="tableHead">Agente Aduanal</div>
            </div>
            <div class="container">
                <div class="itemLabel">Nombre:</div>
                <div style="width: 70%">
                    <asp:TextBox ID="txtNombreAgente" runat="server" CssClass="textboxg uppercase" Width="98%" onkeydown="nextOnEnter(this,event);" TabIndex="120"></asp:TextBox>
                </div>
                <div class="itemLabel" style="padding-left: 20px;">No. de Patente:</div>
                <div>
                    <asp:TextBox ID="txtPatente" runat="server" CssClass="textboxg uppercase" onkeydown="nextOnEnter(this,event);" TabIndex="121"></asp:TextBox>
                </div>
            </div>
        </asp:Panel>
        <div style="padding: 20px; text-align: center">
            <asp:Button ID="btnOK" runat="server" Text="Aceptar" CssClass="btn" TabIndex="125" />
            &nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btna" TabIndex="126" CausesValidation="False" />
        </div>
    </asp:Panel>



</asp:Panel>
<uc1:cntrlError runat="server" ID="cntrlError" />
<uc2:cntrlRepAnexo29 ID="cntrlRepAnexo291" runat="server" />

<uc3:cntrlRepAnexo29XLS ID="cntrlRepAnexo29XLS1" runat="server" />


