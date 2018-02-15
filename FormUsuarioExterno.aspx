<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormUsuarioExterno.aspx.cs" Inherits="Connecting.Web.FormUsuarioExterno" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        var postponedCallbackValue = null;

        function OnEndCallbackPanel(s, e) {

            if (postponedCallbackValue != null) {
                callbackPanel.PerformCallback(postponedCallbackValue);
                postponedCallbackValue = null;
            }

            if (grid.cpData != "") {
                txtClave.SetText(grid.cpData);
                txtConfirmarClave.SetText(grid.cpData);
            }

            if (grid.cpError) {
                alert(grid.cpError);
            } else {
                popCambiarClave.Hide();
            }
        }

        function ShowPopupEditar() {
            popUsuario.Show();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'IdUsuario;NombreUsuario;CorreoElectronico;IdRol;NitCrm;IdPerfil', OnGetRowValues);
        }

        function OnGetRowValues(values) {
            if (values[0] != null) {

                bandera = "Editar";
                txtUsuario.SetText(values[0]);
                txtNombre.SetText(values[1]);
                txtCorreo.SetText(values[2]);
                cmbRoles.SetValue(values[3]);
                cmbRoles.SetEnabled(false);


                //Administador
                if (values[3] == "1") {
                    cmbSocios.SetVisible(false);
                    lblSocio.SetVisible(false);
                    cmbCompradores.SetVisible(false);
                    lblComprador.SetVisible(false);
                }
                //Socio
                if (values[3] == "2") {
                    cmbSocios.SetVisible(true);
                    lblSocio.SetVisible(true);
                    cmbCompradores.SetVisible(false);
                    lblComprador.SetVisible(false);
                    cmbSocios.SetValue(values[4]);
                    callbackPanel.PerformCallback(values[4] + "#editarSelPerfil");
                }

                //Comprador
                if (values[3] == "3") {
                    cmbSocios.SetVisible(false);
                    lblSocio.SetVisible(false);
                    cmbCompradores.SetVisible(true);
                    lblComprador.SetVisible(true);
                    if (values[5] == 0)
                        cmbCompradores.SetValue(null);
                    else
                        cmbCompradores.SetValue(values[5]);

                    callbackPanel.PerformCallback(values[5] + "#editarSelPerfil");
                }
            }
            else {
                Nuevo();
            }
        }


        function ShowPopupNuevo() {
            Nuevo();
            popUsuario.Show();
            txtNombre.Focus();
        }

        function GenerarClave(s, e) {

            txtClave.SetEnabled(!cbxGenerarClave.GetValue());
            txtConfirmarClave.SetEnabled(!cbxGenerarClave.GetValue());


            if (cbxGenerarClave.GetValue()) {
                if (callbackPanel.InCallback()) {
                    postponedCallbackValue = "0#generarClave";
                } else {
                    callbackPanel.PerformCallback("0#generarClave");
                }
            }
        }

        function OnGrabar(s, e) {
            if (ASPxClientEdit.ValidateGroup('valUsuario')) {
                if (txtClave.GetText() == txtConfirmarClave.GetText()) {
                    if (callbackPanel.InCallback()) {
                        postponedCallbackValue = bandera + "#grabar";
                    } else {
                        callbackPanel.PerformCallback(bandera + "#grabar");
                    }
                } else {
                    alert("Las claves no coinciden.");
                }
            }
        }

        var bandera = null;

        function Nuevo() {
            txtUsuario.SetText("");
            txtNombre.SetText("");
            txtCorreo.SetText("");
            cbxGenerarClave.SetValue(false);
            cbxGenerarClave.SetVisible(true);
            txtClave.SetText("");
            txtConfirmarClave.SetText("");
            cmbRoles.SetValue(null);
            cmbRoles.SetEnabled(true);
            cmbSocios.SetValue(null);
            cmbSocios.SetVisible(false);
            lblSocio.SetVisible(false);
            cmbCompradores.SetValue(null);
            cmbCompradores.SetVisible(false);
            lblComprador.SetVisible(false);
            lblClave.SetVisible(true);
            txtClave.SetVisible(true);
            lblConfirmarClave.SetVisible(true);
            txtConfirmarClave.SetVisible(true);
            bandera = "Nuevo";
        }

        function Cancelar() {
            bandera = null;
            popUsuario.Hide();
        }

        function ShowPopupCambiarClave() {
            popCambiarClave.Show();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'IdUsuario;NombreUsuario', OnGetRowCambioClave);
        }

        function OnGetRowCambioClave(values) {

            if (values[0] != null) {
                txtIdUsuarioCambioClave.SetText(values[0]);
                txtNombreUsuarioCambioClave.SetText(values[1]);
                txtNuevaClave.Focus();
            };
        }

        function OnCambiarClaveClick(s, e) {
            if (ASPxClientEdit.ValidateGroup('valCambiarClave')) {
                if (txtNuevaClave.GetText() == txtNuevaClaveConfirmar.GetText()) {
                    if (txtNuevaClave.GetText().length >= 8) {
                        if (callbackPanel.InCallback()) {
                            postponedCallbackValue = "0#cambarclave";
                        } else {
                            callbackPanel.PerformCallback("0#cambarclave");
                        }
                    } else {
                        alert("Se requiere un mínimo de 8 caracteres para la clave.");
                    }
                } else {
                    alert("Las claves no coinciden.");
                }
            }
        }

        function OnRolChanged(s, e) {

            if (s.GetValue() == "1") //administrador
            {
                cmbSocios.SetVisible(false);
                lblSocio.SetVisible(false);
                cmbCompradores.SetVisible(false);
                lblComprador.SetVisible(false);

            } else if (s.GetValue() == "2") //socio
            {
                cmbSocios.SetVisible(true);
                lblSocio.SetVisible(true);
                cmbCompradores.SetVisible(false);
                lblComprador.SetVisible(false);
            } else {
                if (s.GetValue() == "3") //comprador
                {
                    cmbSocios.SetVisible(false);
                    lblSocio.SetVisible(false);
                    cmbCompradores.SetVisible(true);
                    lblComprador.SetVisible(true);
                }
            }
            cmbSocios.SetValue(null);
            cmbCompradores.SetValue(null);
        }

    </script>

    <div class="form-envolver-pagina">

        <div class="form-titulo-principal"><span>Catálogo de Usuarios</span></div>
        <div>
            <dx:ASPxCallbackPanel ID="callbackPanel" ClientInstanceName="callbackPanel" runat="server" Width="100%" OnCallback="callbackPanel_Callback">
                <ClientSideEvents EndCallback="OnEndCallbackPanel"></ClientSideEvents>
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div>
                            <table style="width: 100%">
                                <tr>
                                    <td align="left">
                                        <dx:ASPxButton ID="btnNuevo" runat="server" Text="Crear Usuario"  ClientInstanceName="btnNuevo" AutoPostBack="false">
                                            <ClientSideEvents Click="ShowPopupNuevo"></ClientSideEvents>
                                            <Image Url="~/IMG/Nuevo.png"></Image>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <dx:ASPxLabel ID="lblErrorOtros" runat="server" ClientInstanceName="lblError" EnableViewState="False" ForeColor="Red" >
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxGridView ID="grid" runat="server"  KeyFieldName="IdUsuario" ClientInstanceName="grid" Width="100%" AutoGenerateColumns="False"
                                            OnRowDeleting="grid_RowDeleting" OnAfterPerformCallback="grid_AfterPerformCallback">
                                            <Columns>
                                                <dx:GridViewCommandColumn VisibleIndex="12" Width="30px" ButtonType="Image"
                                                    Caption="Borrar" ShowDeleteButton="True">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="Usuario" FieldName="IdUsuario" VisibleIndex="0" ReadOnly="True">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                            <RequiredField ErrorText="Requerido" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="NombreUsuario" VisibleIndex="1">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                            <RequiredField ErrorText="Requerido" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataHyperLinkColumn Caption="Editar" VisibleIndex="10" Width="30px" FieldName="IdUsuario">
                                                    <PropertiesHyperLinkEdit ImageUrl="Content/Images/Editar.png" NavigateUrlFormatString="javascript:ShowPopupEditar();"
                                                        Target="_self" Text="Editar" TextFormatString="Editar">
                                                    </PropertiesHyperLinkEdit>
                                                    <Settings AllowAutoFilter="False" AllowAutoFilterTextInputTimer="False" AllowDragDrop="False"
                                                        AllowGroup="False" AllowHeaderFilter="False" AllowSort="False" ShowFilterRowMenu="False"
                                                        ShowInFilterControl="False" />
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                </dx:GridViewDataHyperLinkColumn>
                                                <dx:GridViewDataDateColumn Caption="Fecha Expiración" FieldName="FechaExpiracionClave" VisibleIndex="2" Visible="False">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn Caption="IdRol" FieldName="IdRol" VisibleIndex="7" Name="IdRol" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nit" FieldName="NitCrm" VisibleIndex="3" Name="Nit">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Rol" FieldName="NombreRol" Name="NombreRol" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataHyperLinkColumn Caption="Cambiar Clave" Name="CambiarClave" FieldName="IdUsuario" VisibleIndex="11" Width="50px">
                                                    <PropertiesHyperLinkEdit ImageUrl="Content/Images/CambiarPassword.png" NavigateUrlFormatString="javascript:ShowPopupCambiarClave();" Target="_self"
                                                        Text="Cambiar" TextFormatString="">
                                                    </PropertiesHyperLinkEdit>
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                </dx:GridViewDataHyperLinkColumn>
                                                <dx:GridViewDataTextColumn Caption="IdPerfil" FieldName="IdPerfil" Name="IdPerfil" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="CorreoElectronico" FieldName="CorreoElectronico" Name="CorreoElectronico" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsCommandButton>
                                                <NewButton RenderMode="Button">
                                                    <Image Url="Content/Images/Nuevo.png"></Image>
                                                </NewButton>
                                                <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar">
                                                </UpdateButton>
                                                <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar">
                                                </CancelButton>
                                                <EditButton RenderMode="Button">
                                                    <Image Url="Content/Images/Editar.png"></Image>
                                                </EditButton>
                                                <DeleteButton RenderMode="Button">
                                                    <Image Url="Content/Images/Borrar.png"></Image>
                                                </DeleteButton>
                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                <ClearFilterButton>
                                                    <Image Url="Content/Images/clear.png"></Image>
                                                </ClearFilterButton>
                                            </SettingsCommandButton>
                                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" AllowSelectSingleRowOnly="True" EnableRowHotTrack="True" />
                                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" />
                                            <SettingsText Title="Salon" />
                                            <SettingsPopup>
                                                <EditForm Width="350px" Modal="True" />
                                            </SettingsPopup>
                                            <SettingsDataSecurity AllowInsert="False" />
                                            <SettingsSearchPanel Visible="true" />
                                            <SettingsPager PageSize="15"></SettingsPager>
                                        </dx:ASPxGridView>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <dx:ASPxPopupControl ID="popUsuario" ClientInstanceName="popUsuario" Width="600px"  runat="server"
                            HeaderText="Edición de Usuario" CloseAction="CloseButton" AllowDragging="True" PopupHorizontalAlign="WindowCenter"
                            PopupVerticalAlign="WindowCenter" Modal="True">
                            <ContentCollection>
                                <dx:PopupControlContentControl runat="server">
                                    <table width="100%">
                                        <tr>
                                            <td align="right">Usuario: 
                                            </td>
                                            <td align="left">
                                                <dx:ASPxTextBox ID="txtUsuario" ClientInstanceName="txtUsuario"  runat="server" Width="400px" BackColor="LightYellow" ReadOnly="True">
                                                    <%--                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Right" SetFocusOnError="True" ValidationGroup="valUsuario">
                                                        <RequiredField IsRequired="True" ErrorText="Requerido" />
                                                    </ValidationSettings>--%>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Nombre:
                                            </td>
                                            <td align="left">
                                                <dx:ASPxTextBox ID="txtNombre" ClientInstanceName="txtNombre"  runat="server" Width="400px">
                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Right" SetFocusOnError="True" ValidationGroup="valUsuario" ErrorDisplayMode="ImageWithTooltip">
                                                        <RequiredField IsRequired="True" ErrorText="Requerido" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Correo electronico:
                                            </td>
                                            <td align="left">
                                                <dx:ASPxTextBox ID="txtCorreo" ClientInstanceName="txtCorreo"  runat="server" Width="400px">
                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Right" SetFocusOnError="True" ValidationGroup="valUsuario" ErrorDisplayMode="ImageWithTooltip">
                                                        <RequiredField IsRequired="True" ErrorText="Requerido" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td align="left">
                                                <dx:ASPxCheckBox ID="cbxGenerarClave" runat="server" CheckState="Unchecked" Text="GenerarClave" ClientInstanceName="cbxGenerarClave">
                                                    <ClientSideEvents CheckedChanged="GenerarClave"></ClientSideEvents>
                                                </dx:ASPxCheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <dx:ASPxLabel ID="lblClave" ClientInstanceName="lblClave"  runat="server" Text="Clave:"></dx:ASPxLabel>
                                            </td>
                                            <td align="left">
                                                <dx:ASPxTextBox ID="txtClave" ClientInstanceName="txtClave"  runat="server" Width="200px" Password="True">
                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Right" SetFocusOnError="True" ValidationGroup="valUsuario">
                                                        <RequiredField IsRequired="True" ErrorText="Requerido" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <dx:ASPxLabel ID="lblConfirmarClave" ClientInstanceName="lblConfirmarClave"  runat="server" Text="Confirmar clave:"></dx:ASPxLabel>
                                            </td>
                                            <td align="left">
                                                <dx:ASPxTextBox ID="txtConfirmarClave" ClientInstanceName="txtConfirmarClave"  runat="server" Width="200px" Password="True">
                                                    <ValidationSettings Display="Dynamic" ErrorTextPosition="Right" SetFocusOnError="True" ValidationGroup="valUsuario">
                                                        <RequiredField IsRequired="True" ErrorText="Requerido" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Rol:
                                            </td>
                                            <td align="left">
                                                <dx:ASPxComboBox ID="cmbRoles" runat="server"  DropDownStyle="DropDownList" ValueField="IdRol" ClientInstanceName="cmbRoles"
                                                    TextField="NombreRol" ValueType="System.Int32" Width="400px" NullText="Seleccionar">
                                                    <ClientSideEvents ValueChanged="OnRolChanged"></ClientSideEvents>
                                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="valUsuario">
                                                        <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="auto-style1">
                                                <dx:ASPxLabel ID="lblSocio" runat="server" Text="Socio:" ClientInstanceName="lblSocio"  ClientVisible="False">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td align="left" class="auto-style1">
                                                <dx:ASPxComboBox ID="cmbSocios" runat="server"  DropDownStyle="DropDownList" IncrementalFilteringMode="Contains" ClientInstanceName="cmbSocios"
                                                    CallbackPageSize="30" EnableCallbackMode="True" ValueField="Id" TextField="Nombre" Width="400px" NullText="Seleccionar" OnItemRequestedByValue="cmbSocios_ItemRequestedByValue" OnItemsRequestedByFilterCondition="cmbSocios_ItemsRequestedByFilterCondition" ClientVisible="False">

                                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="valUsuario">
                                                        <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                    </ValidationSettings>

                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <dx:ASPxLabel ID="lblComprador" runat="server" ClientInstanceName="lblComprador" Text="Comprador"  ClientVisible="False">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td align="left">
                                                <dx:ASPxComboBox ID="cmbCompradores" runat="server" CallbackPageSize="30" ClientInstanceName="cmbCompradores" EnableCallbackMode="True" NullText="Seleccionar"
                                                    OnItemRequestedByValue="cmbCompradores_ItemRequestedByValue" OnItemsRequestedByFilterCondition="cmbCompradores_ItemsRequestedByFilterCondition"
                                                    TextField="Nombre" ValueField="Id" ValueType="System.Int32" Width="400px" ClientVisible="False" AllowNull="True">
                                                    <ClearButton DisplayMode="Always" ToolTip="Limpia la seleccion actual">
                                                    </ClearButton>
                                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                                        <RequiredField ErrorText="Valor Requeriddo" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="left">
                                                <dx:ASPxLabel ID="lblError" runat="server" ClientInstanceName="lblError" EnableViewState="False" ForeColor="Red">
                                                </dx:ASPxLabel>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <dx:ASPxButton ID="btnGrabar" ClientInstanceName="btnGrabar"  AutoPostBack="False" runat="server" Text="Grabar" ValidationGroup="valUsuario">
                                                                <ClientSideEvents Click="OnGrabar"></ClientSideEvents>
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxButton ID="btnCancelar" ClientInstanceName="btnCancelar"  runat="server" Text="Cancelar" AutoPostBack="False">
                                                                <ClientSideEvents Click="Cancelar"></ClientSideEvents>
                                                            </dx:ASPxButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>

                    </dx:PanelContent>
                </PanelCollection>

            </dx:ASPxCallbackPanel>
        </div>

        <dx:ASPxPopupControl ID="popCambiarClave" ClientInstanceName="popCambiarClave" Width="600px"  runat="server"
            HeaderText="Cambio de Contraseña" CloseAction="CloseButton" AllowDragging="True" PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="WindowCenter" Modal="True">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" >
                        <Items>
                            <dx:LayoutGroup GroupBoxDecoration="None" HorizontalAlign="Right">
                                <Items>
                                    <dx:LayoutItem Caption="Id">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txtIdUsuarioCambioClave" runat="server"  Width="300px" ClientInstanceName="txtIdUsuarioCambioClave" ClientEnabled="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Nombre">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txtNombreUsuarioCambioClave" runat="server"  Width="300px" ClientInstanceName="txtNombreUsuarioCambioClave" ClientEnabled="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Nueva clave" HelpText="Mínimo (8) caracteres">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txtNuevaClave" runat="server"  Width="300px" ClientInstanceName="txtNuevaClave" Password="True">
                                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="valCambiarClave">
                                                        <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Confirmar clave" HelpText="Ingrese nuevamente la clave">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txtNuevaClaveConfirmar" runat="server"  Width="300px" ClientInstanceName="txtNuevaClaveConfirmar" Password="True">
                                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="valCambiarClave">
                                                        <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup ColCount="2" GroupBoxDecoration="None">
                                <Items>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxButton ID="btnAceptarCambioClave" runat="server" Text="Cambiar Password"  ClientInstanceName="btnAceptarCambioClave" AutoPostBack="false">
                                                    <ClientSideEvents Click="OnCambiarClaveClick"></ClientSideEvents>
                                                </dx:ASPxButton>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxButton ID="btnCancelarCambioClave" runat="server" Text="Cancelar"  ClientInstanceName="btnCancelarCambioClave" AutoPostBack="False">
                                                    <ClientSideEvents Click="function(s, e) {popCambiarClave.Hide();}" />
                                                </dx:ASPxButton>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                        </Items>
                    </dx:ASPxFormLayout>


                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

    </div>
</asp:Content>
