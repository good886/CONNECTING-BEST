<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucFruta.ascx.cs" Inherits="Connecting.Web.UserControl.wucFruta" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<script type="text/javascript">

    function endCallback(s, e) {
        
        if (s.cpError) {
            alert(s.cpError);
        }
    }

    function  onUpdate(s,e) {
        s.UpdateEdit();
    } 

</script>

<div class="per-prod-datos">

    <dx:ASPxGridView ID="gridProductos" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdProducto;IdFruta" Theme="Office2010Silver"
        ClientInstanceName="gridProductos" OnRowUpdating="gridProductos_RowUpdating" meta:resourcekey="gridProductosResource1">        
        <Styles>
            <Header CssClass="per-prod-datos-header" Wrap="True"></Header>
            <TitlePanel Font-Bold="True" Font-Size="8pt" HorizontalAlign="Left" ForeColor="#CC3300"></TitlePanel>
        </Styles>
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False"  AllowEdit="True"/>
        <Columns>
            <dx:GridViewDataTextColumn Caption="Categoria" FieldName="NombreTipoProducto" GroupIndex="0" Name="NombreTipoProducto"
                ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="0" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nombre" FieldName="NombreProducto" Name="NombreProducto" VisibleIndex="2" ReadOnly="True" Width="300px" meta:resourcekey="GridViewDataTextColumnResource2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Estacionalidad" FieldName="Estacionalidad" Name="Estacionalidad" ShowInCustomizationForm="True" VisibleIndex="3" meta:resourcekey="GridViewDataCheckColumnResource1">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Fresco" FieldName="Fresco" Name="Fresco" ShowInCustomizationForm="True" VisibleIndex="4" meta:resourcekey="GridViewDataCheckColumnResource2">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Listo Comer" FieldName="ListoComer" Name="ListoComer" ShowInCustomizationForm="True" VisibleIndex="6" meta:resourcekey="GridViewDataCheckColumnResource3">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Empacado" FieldName="Empacado" Name="Empacado" ShowInCustomizationForm="True" VisibleIndex="8" meta:resourcekey="GridViewDataCheckColumnResource4">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Congelados" FieldName="Congelados" Name="Congelados" ShowInCustomizationForm="True" VisibleIndex="9" meta:resourcekey="GridViewDataCheckColumnResource5">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Orgánico" FieldName="Organico" Name="Organico" ShowInCustomizationForm="True" VisibleIndex="10" meta:resourcekey="GridViewDataCheckColumnResource6">
                <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsBehavior AllowFixedGroups="True" AutoExpandAllGroups="True" />
        <SettingsEditing Mode="Batch">
            <BatchEditSettings EditMode="Row" StartEditAction="Click" ShowConfirmOnLosingChanges="False" />
        </SettingsEditing>
        <Settings ShowGroupPanel="False" GroupFormat="{1} {2}" ShowTitlePanel="False" VerticalScrollableHeight="500" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" />
        <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
            <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
            <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
            <EditButton Text="Editar"></EditButton>
        </SettingsCommandButton>
        <ClientSideEvents EndCallback="endCallback" RowCollapsing="onUpdate" RowExpanding="onUpdate" />
        <SettingsPager PageSize="50" Mode="ShowAllRecords"></SettingsPager>
    </dx:ASPxGridView>

</div>
