<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucManufactura.ascx.cs" Inherits="Connecting.Web.UserControl.wucManufactura" %>
<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<script type="text/javascript">

    function endCallback(s, e) {
        if (s.cpError) {
            alert(s.cpError);
            s.cpError = "";
        }
    }

    function  onUpdate(s,e) {
        s.UpdateEdit();
    } 

</script>


<div class="per-prod-datos">
    <dx:ASPxGridView ID="gridProductos" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdProducto;IdManufactura" Theme="Office2010Silver"
        ClientInstanceName="gridProductos" OnRowUpdating="gridProductos_RowUpdating" ToolTip="Seleccione los productos  que ofrece" meta:resourcekey="gridProductosResource1" >
        <SettingsText Title="Seleccione los productos que ofrece" />
        <Styles>
            <GroupRow Font-Bold="True"></GroupRow>
            <GroupPanel Font-Bold="False"></GroupPanel>
            <TitlePanel Font-Bold="True" Font-Size="9pt" HorizontalAlign="Left" ForeColor="#CC3300"></TitlePanel>            
        </Styles>
        <SettingsDataSecurity AllowInsert="False" AllowDelete="False"  AllowEdit="True"/>
        <Columns>
            <dx:GridViewDataTextColumn Caption="Producto" FieldName="NombreProducto" Name="NombreProducto" VisibleIndex="3" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource1" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Cantidad" Name="Cantidad" VisibleIndex="5" Width="120px" meta:resourcekey="GridViewDataTextColumnResource2" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Frecuencia de despacho" FieldName="FrecuenciaDespacho" Name="FrecuenciaDespacho" VisibleIndex="6" Width="150px" meta:resourcekey="GridViewDataTextColumnResource3" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Marque" FieldName="Seleccionado" Name="Seleccionado" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px" meta:resourcekey="GridViewDataCheckColumnResource1" >
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn Caption="Categoria" FieldName="NombreTipoProducto" GroupIndex="0" Name="NombreTipoProducto" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="0" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource4" >
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsEditing Mode="Batch" NewItemRowPosition="Bottom">
            <BatchEditSettings EditMode="Row" StartEditAction="Click" ShowConfirmOnLosingChanges="False"/>
        </SettingsEditing>
        <Settings GroupFormat="{1} {2}" VerticalScrollBarMode="Auto" VerticalScrollableHeight="500" ShowTitlePanel="False" />
        <SettingsBehavior AllowFixedGroups="True" AutoExpandAllGroups="True" />
        <SettingsCommandButton>
            <NewButton ButtonType="Image" RenderMode="Image" Text="Nuevo Producto">
                <Image Url="~/IMG/Nuevo.png"></Image>
            </NewButton>
            <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
            <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
            <EditButton>
                <Image Url="~/IMG/Editar.png"></Image>
            </EditButton>
            <DeleteButton>
                <Image Url="~/IMG/Borrar.png"></Image>
            </DeleteButton>
            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
            <ClearFilterButton>
                <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
            </ClearFilterButton>
        </SettingsCommandButton>
        <SettingsPager PageSize="50" Mode="ShowAllRecords"></SettingsPager>
        <ClientSideEvents RowCollapsing="onUpdate" RowExpanding="onUpdate" EndCallback="endCallback" />
    </dx:ASPxGridView>
</div>