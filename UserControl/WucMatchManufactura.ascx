<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WucMatchManufactura.ascx.cs" Inherits="Connecting.Web.UserControl.WucMatchManufactura" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<style type="text/css">
    .layoutGroupBoxCaption {
        font-size: 16px;
        font-weight: bold;
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
    <dx:ASPxGridView ID="gridMatch" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdManufactura" Theme="Moderno"
        ClientInstanceName="gridMatch" ToolTip="Manufacturas" OnHtmlRowPrepared="gridMatch_HtmlRowPrepared" meta:resourcekey="gridMatchResource1" OnAfterPerformCallback="gridMatch_AfterPerformCallback">
        <SettingsDataSecurity AllowInsert="False" AllowDelete="False" AllowEdit="False" />
        <SettingsSearchPanel Visible="False" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Empresa" FieldName="Empresa" Name="Empresa" VisibleIndex="0" GroupIndex="0" SortIndex="0" SortOrder="Ascending" meta:resourcekey="GridViewDataTextColumnResource1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" FieldName="NombreProducto" Name="NombreProducto" VisibleIndex="1" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Cantidad" Name="Cantidad" VisibleIndex="2" Width="120px" meta:resourcekey="GridViewDataTextColumnResource3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Frecuencia de despacho" FieldName="FrecuenciaDespacho" Name="FrecuenciaDespacho" VisibleIndex="3" Width="120px" meta:resourcekey="GridViewDataTextColumnResource4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="CumpleConCertificaciones" FieldName="CumpleConCertificaciones" Name="CumpleConCertificaciones" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5" meta:resourcekey="GridViewDataTextColumnResource5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Detalle" FieldName="IdPerfil" Name="DetalleComprador" ShowInCustomizationForm="True" VisibleIndex="6" Width="60px" meta:resourcekey="GridViewDataHyperLinkColumnResource1">
                <PropertiesHyperLinkEdit ImageUrl="~/IMG/Detalle.png" NavigateUrlFormatString="javascript:MostrarInfo({0});" Target="_self" Text="Detalle">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn Caption="IdPerfil" FieldName="IdPerfil" Name="IdPerfil" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7" meta:resourcekey="GridViewDataTextColumnResource6">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings GroupFormat="{1} {2}" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
        <SettingsBehavior AllowFixedGroups="True" AutoExpandAllGroups="True" />
        <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
            <ClearFilterButton>
                <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
            </ClearFilterButton>
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


