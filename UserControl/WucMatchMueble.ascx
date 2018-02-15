<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WucMatchMueble.ascx.cs" Inherits="Connecting.Web.UserControl.WucMatchMueble" %>
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
    <dx:ASPxGridView ID="gridMatch" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdMueble" Theme="Moderno" OnHtmlRowPrepared="gridMatch_HtmlRowPrepared" meta:resourcekey="gridMatchResource1" OnAfterPerformCallback="gridMatch_AfterPerformCallback">
        <SettingsText Title="Mueble" />
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" AllowEdit="False" />
        <Styles>
            <Header CssClass="customHeader" Wrap="True"></Header>
            <TitlePanel Font-Bold="True" Font-Size="14pt" HorizontalAlign="Left" ForeColor="#999999">
            </TitlePanel>
        </Styles>
        <Columns>
            <dx:GridViewDataTextColumn Caption="Empresa" FieldName="Empresa" Name="Empresa" VisibleIndex="0" GroupIndex="0" SortIndex="0" SortOrder="Ascending" meta:resourcekey="GridViewDataTextColumnResource1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" FieldName="NombreProducto" Name="NombreProducto" VisibleIndex="2" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource2" MinWidth="150" Width="250px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Volumen" FieldName="Volumen" Name="Volumen" ShowInCustomizationForm="True" VisibleIndex="7" Width="90px" meta:resourcekey="GridViewDataTextColumnResource3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Frecuencia" FieldName="Frecuencia" Name="Frecuencia" ShowInCustomizationForm="True" VisibleIndex="8" Width="90px" meta:resourcekey="GridViewDataTextColumnResource4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Estilo" ShowInCustomizationForm="True" VisibleIndex="3" meta:resourcekey="GridViewBandColumnResource1">
                <HeaderStyle HorizontalAlign="Center" />
                <Columns>
                    <dx:GridViewDataCheckColumn Caption="Clasico" FieldName="EstiloClasico" Name="EstiloClasico" ShowInCustomizationForm="True" VisibleIndex="0" Width="55px" meta:resourcekey="GridViewDataCheckColumnResource1">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Contemporaneo" FieldName="EstiloContemporaneo" Name="EstiloContemporaneo" ShowInCustomizationForm="True" VisibleIndex="1" Width="95px" ToolTip="Estilo Contemporaneo" meta:resourcekey="GridViewDataCheckColumnResource2">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Rustico" FieldName="EstiloRustico" Name="EstiloRustico" ShowInCustomizationForm="True" VisibleIndex="2" Width="55px" meta:resourcekey="GridViewDataCheckColumnResource3">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Material" ShowInCustomizationForm="True" VisibleIndex="4" meta:resourcekey="GridViewBandColumnResource2">
                <HeaderStyle HorizontalAlign="Center" />
                <Columns>
                    <dx:GridViewDataCheckColumn Caption="Madera Solida" FieldName="MaterialMaderaSolida" Name="MaterialMaderaSolida" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" meta:resourcekey="GridViewDataCheckColumnResource4">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Aglomerado" FieldName="MaterialAglomerado" Name="MaterialAglomerado" ShowInCustomizationForm="True" VisibleIndex="1" Width="87px" meta:resourcekey="GridViewDataCheckColumnResource5">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Bambu" FieldName="MaterialBambu" Name="MaterialBambu" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px" meta:resourcekey="GridViewDataCheckColumnResource6">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Teka" FieldName="MaterialTeka" Name="MaterialTeka" ShowInCustomizationForm="True" VisibleIndex="3" Width="40px" meta:resourcekey="GridViewDataCheckColumnResource7">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Fibra Natural" FieldName="MaterialFibraNatural" Name="MaterialFibraNatural" ShowInCustomizationForm="True" VisibleIndex="4" Width="60px" meta:resourcekey="GridViewDataCheckColumnResource8">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Hierro" FieldName="MaterialHierro" Name="MaterialHierro" ShowInCustomizationForm="True" VisibleIndex="5" Width="50px" meta:resourcekey="GridViewDataCheckColumnResource9">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Sintetico" FieldName="MaterialSintetico" Name="MaterialSintetico" ShowInCustomizationForm="True" VisibleIndex="6" Width="65px" meta:resourcekey="GridViewDataCheckColumnResource10">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Otros" FieldName="MaterialOtro" Name="MaterialOtro" ShowInCustomizationForm="True" VisibleIndex="7" Width="40px" meta:resourcekey="GridViewDataCheckColumnResource11">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Acabado" ShowInCustomizationForm="True" VisibleIndex="6" meta:resourcekey="GridViewBandColumnResource3">
                <HeaderStyle HorizontalAlign="Center" />
                <Columns>
                    <dx:GridViewDataCheckColumn Caption="Alto" FieldName="AcabadoAlto" Name="AcabadoAlto" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px" meta:resourcekey="GridViewDataCheckColumnResource12">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Intermedio" FieldName="AcabadoIntermedio" Name="AcabadoIntermedio" ShowInCustomizationForm="True" VisibleIndex="1" Width="95px" meta:resourcekey="GridViewDataCheckColumnResource13">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Medio" FieldName="AcabadoMedio" Name="AcabadoMedio" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px" meta:resourcekey="GridViewDataCheckColumnResource14">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Sencillo" FieldName="AcabadoSencillo" Name="AcabadoSencillo" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px" meta:resourcekey="GridViewDataCheckColumnResource15">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn Caption="CumpleConCertificaciones" FieldName="CumpleConCertificaciones" Name="CumpleConCertificaciones" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10" meta:resourcekey="GridViewDataTextColumnResource5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Detalle" FieldName="IdPerfil" Name="DetalleComprador" ShowInCustomizationForm="True" VisibleIndex="11" Width="60px" meta:resourcekey="GridViewDataHyperLinkColumnResource1">
                <PropertiesHyperLinkEdit ImageUrl="~/IMG/Detalle.png" NavigateUrlFormatString="javascript:MostrarInfo('{0}');" Target="_self" Text="Detalle">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn Caption="IdPerfil" FieldName="IdPerfil" Name="IdPerfil" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9" meta:resourcekey="GridViewDataTextColumnResource6">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFixedGroups="True" AutoExpandAllGroups="True" />
        <%--<Settings HorizontalScrollBarMode="Auto" ShowGroupPanel="False" GroupFormat="{1} {2}" ShowTitlePanel="True" />--%>
        <Settings ShowGroupPanel="False" GroupFormat="{1} {2}" ShowTitlePanel="False" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" />
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


