<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucMueble.ascx.cs" Inherits="Connecting.Web.UserControl.wucMueble" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<script type="text/javascript">

    function endCallback(s, e) {
        if (s.cpError) {
            alert(s.cpError);
            s.cpError = "";
        } 
    }

    function onUpdate(s, e) {
        s.UpdateEdit();
    }
    
</script>


<div class="per-prod-datos">

    <dx:ASPxGridView ID="gridProductos" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdProducto;IdMueble"
        Theme="Office2010Silver" OnRowUpdating="gridProductos_RowUpdating" ClientInstanceName="gridProductos" meta:resourcekey="gridProductosResource1">        
        <SettingsText Title="Seleccione los productos que ofrece" />
        <Styles>
            <Header CssClass="per-prod-datos-header" Wrap="True"></Header>
            <TitlePanel Font-Bold="True" Font-Size="8pt" HorizontalAlign="Left" ForeColor="#CC3300"></TitlePanel>
        </Styles>
        <SettingsDataSecurity AllowInsert="False" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Categoria" FieldName="NombreTipoProducto" GroupIndex="0" Name="NombreTipoProducto"
                ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="0" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" FieldName="NombreProducto" Name="NombreProducto" VisibleIndex="2" ReadOnly="True" Width="200px" meta:resourcekey="GridViewDataTextColumnResource2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Volumen" FieldName="Volumen" Name="Volumen" ShowInCustomizationForm="True" VisibleIndex="6" Width="80px" meta:resourcekey="GridViewDataTextColumnResource3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Frecuencia" FieldName="Frecuencia" Name="Frecuencia" ShowInCustomizationForm="True" VisibleIndex="7" Width="80px" meta:resourcekey="GridViewDataTextColumnResource4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Estilo" ShowInCustomizationForm="True" VisibleIndex="3" meta:resourcekey="GridViewBandColumnResource1">
                <HeaderStyle HorizontalAlign="Center" />
                <Columns>
                    <dx:GridViewDataCheckColumn Caption="Clasico" FieldName="EstiloClasico" Name="EstiloClasico" ShowInCustomizationForm="True" VisibleIndex="0" Width="55px" meta:resourcekey="GridViewDataCheckColumnResource1">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Contemporaneo" FieldName="EstiloContemporaneo" Name="EstiloContemporaneo" ShowInCustomizationForm="True" VisibleIndex="1" Width="85px" ToolTip="Estilo Contemporaneo" meta:resourcekey="GridViewDataCheckColumnResource2">
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
                    <dx:GridViewDataCheckColumn Caption="Bambu" FieldName="MaterialBambu" Name="MaterialBambu" ShowInCustomizationForm="True" VisibleIndex="2" Width="55px" meta:resourcekey="GridViewDataCheckColumnResource6">
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
            <dx:GridViewBandColumn Caption="Acabado" ShowInCustomizationForm="True" VisibleIndex="5" meta:resourcekey="GridViewBandColumnResource3">
                <HeaderStyle HorizontalAlign="Center" />
                <Columns>
                    <dx:GridViewDataCheckColumn Caption="Alto" FieldName="AcabadoAlto" Name="AcabadoAlto" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px" meta:resourcekey="GridViewDataCheckColumnResource12">
                        <PropertiesCheckEdit ValueChecked="S" ValueType="System.String" ValueUnchecked="N">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="Intermedio" FieldName="AcabadoIntermedio" Name="AcabadoIntermedio" ShowInCustomizationForm="True" VisibleIndex="1" Width="75px" meta:resourcekey="GridViewDataCheckColumnResource13">
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
        </Columns>
        <SettingsBehavior AllowFixedGroups="True" AutoExpandAllGroups="True" />
        <SettingsEditing Mode="Batch" NewItemRowPosition="Bottom">
            <BatchEditSettings EditMode="Row" StartEditAction="Click" ShowConfirmOnLosingChanges="False" />
        </SettingsEditing>
        <Settings ShowGroupPanel="False" GroupFormat="{1} {2}" ShowTitlePanel="False" VerticalScrollableHeight="500"
            VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" />
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
