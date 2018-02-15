<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WucMatchFruta.ascx.cs" Inherits="Connecting.Web.UserControl.WucMatchFruta" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<style type="text/css">

    .customHeader {
        height: 48px;
    }

    .seccionDatos {
        width: 100%;
        clear: both;
        overflow: auto;
    }
</style>

<script type="text/javascript">

    function MostrarInfo(idPerfil) {
        if (hflParams.Get("tipo") == "Socio")
            window.open('DetalleComprador.aspx?Id=' + idPerfil, "comprador", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=1000, height=700");
        else
            window.open('DetalleSocio.aspx?Id=' + idPerfil, "socio", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=1000, height=700");
    }

    function OnAceptarMensaje(s, e) {
        popMensajes.Hide();
    }

    function OnEndCallbackGrid(s, e) {

        if (grid.cpError) {
            txtMensaje.SetText(grid.cpError);
            popMensajes.Show();

        } else {
            popMensajes.Hide();
        }
    }
</script>

<div class="seccionDatos">
    <dx:ASPxGridView ID="gridMatch" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdProducto" Theme="Moderno"
        ClientInstanceName="gridMatch" OnHtmlRowPrepared="gridMatch_HtmlRowPrepared" meta:resourcekey="gridMatchResource1" OnAfterPerformCallback="gridMatch_AfterPerformCallback">
        <SettingsDataSecurity AllowInsert="False" AllowEdit="False" AllowDelete="False" />
        <Styles>
            <Header CssClass="customHeader" Wrap="True"></Header>
        </Styles>
        <Columns>
            <dx:GridViewDataTextColumn Caption="Empresa" FieldName="Empresa" Name="Empresa" VisibleIndex="0" GroupIndex="0" SortIndex="0" SortOrder="Ascending" meta:resourcekey="GridViewDataTextColumnResource1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" FieldName="NombreProducto" Name="NombreProducto" VisibleIndex="2" meta:resourcekey="GridViewDataTextColumnResource2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Estacionalidad" FieldName="Estacionalidad" Name="Estacionalidad" ShowInCustomizationForm="True" VisibleIndex="3" meta:resourcekey="GridViewDataCheckColumnResource1">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Fresco" FieldName="Fresco" Name="Fresco" ShowInCustomizationForm="True" VisibleIndex="4" meta:resourcekey="GridViewDataCheckColumnResource2">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Listo Comer" FieldName="ListoComer" Name="ListoComer" ShowInCustomizationForm="True" VisibleIndex="6" meta:resourcekey="GridViewDataCheckColumnResource4">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Empacado" FieldName="Empacado" Name="Empacado" ShowInCustomizationForm="True" VisibleIndex="8" meta:resourcekey="GridViewDataCheckColumnResource6">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Congelados" FieldName="Congelados" Name="Congelados" ShowInCustomizationForm="True" VisibleIndex="9" meta:resourcekey="GridViewDataCheckColumnResource7">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Orgánico" FieldName="Organico" Name="Organico" ShowInCustomizationForm="True" VisibleIndex="10" meta:resourcekey="GridViewDataCheckColumnResource8">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn Caption="CumpleConCertificaciones" FieldName="CumpleConCertificaciones" Name="CumpleConCertificaciones" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11" meta:resourcekey="GridViewDataTextColumnResource3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Detalle" FieldName="IdPerfil" Name="DetalleComprador" ShowInCustomizationForm="True" VisibleIndex="12" Width="60px" meta:resourcekey="GridViewDataHyperLinkColumnResource1">
                <PropertiesHyperLinkEdit ImageUrl="~/IMG/Detalle.png" NavigateUrlFormatString="javascript:MostrarInfo('{0}');" Target="_self" Text="Detalle">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn Caption="IdPerfil" FieldName="IdPerfil" Name="IdPerfil" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13" meta:resourcekey="GridViewDataTextColumnResource4">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFixedGroups="True"  AutoExpandAllGroups="True"/>
        <Settings ShowGroupPanel="False" GroupFormat="{1} {2}" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
        <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
        </SettingsCommandButton>
        <SettingsPager PageSize="25" Mode="ShowAllRecords"></SettingsPager>
    </dx:ASPxGridView>

</div>

<dx:ASPxPopupControl ID="popMensajes" runat="server" CloseAction="CloseButton" HeaderText="Notificación de Mensajes"
    Modal="True" Theme="Moderno" Width="500px" ClientInstanceName="popMensajes" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <div style="clear: both">
                <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Theme="Moderno" Width="100%" ClientInstanceName="txtMensaje">
                    <Border BorderStyle="None" />
                </dx:ASPxMemo>
            </div>
            <div style="width: 120px; margin: 0 auto;">
                <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" Theme="Moderno" AutoPostBack="False">
                    <ClientSideEvents Click="OnAceptarMensaje"></ClientSideEvents>
                </dx:ASPxButton>
            </div>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxHiddenField ID="hflParams" runat="server" ClientInstanceName="hflParams">
</dx:ASPxHiddenField>


