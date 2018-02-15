<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilSocioGenerales.aspx.cs" Inherits="Connecting.Web.PerfilSocioGenerales" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <style type="text/css">
        .formLayoutContainer {
            width: 100%;
            /*margin: auto;*/
            padding: 0px;
            background: white;
        }

        .layoutGroupBoxCaption {
            font-size: 16px;
            font-weight: bold;
        }

        .header {
            font-size: 16px;
            font-weight: bold;
            color: black;
            /*font-family: sans-serif;*/
        }

        .headerStep {
            font-size: 14px;
            font-weight: bold;
            color: navy;
            /*font-family: sans-serif;*/
        }

        .customHeader {
            height: 48px;
        }

        .Estado {
            padding: 5px;
        }
    </style>

    <script type="text/javascript">

        function OnTabOperaOtroPaisInit(s, e) {
            s.SetActiveTabIndex(rblOperaOtroEmpresaPais.GetSelectedIndex());
        }

        function OnOperaOtroPaisChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            tlgOperaOtroPais.SetActiveTabIndex(selectedIndex);
        }

        function OnTabCorporacionInit(s, e) {
            s.SetActiveTabIndex(rblCorporacion.GetSelectedIndex());
        }

        function OnCorporacionChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            tlgCorporacion.SetActiveTabIndex(selectedIndex);
        }


        /* Aprobacion */
        function MostrarPopAprobacion() {
            if (lblEstadoSocio.GetText() == "Aprobado") {
                txtMensaje.SetText('El expediente ya ha sido autorizado');
                popMensajes.Show();
            } else {
                popAprobacion.SetHeaderText("Aprobar Perfil");
                btnAprobarSocio.SetText("Aprobar");
                popAprobacion.Show();
            }
        }

        function CerrarAprobacion() {
            popAprobacion.Hide();
        }

        function Aprobar(s, e) {
            callback.PerformCallback("aprobar");
            popAprobacion.Hide();

        }

        /* Siguiente Pagina */
        function Siguiente(s, e) {
            if (ASPxClientEdit.ValidateGroup('main')) {
                callback.PerformCallback("siguiente");
            }
        }

        /*  Creacion de nota */
        function CrearNota() {
            callback.PerformCallback("nota");
        }


        /*  Desaprobacion*/
        function MostrarPopupDesautorizar() {
            if (lblEstadoSocio.GetText() == "Aprobado") {
                popDesautorizar.Show();
            } else {
                txtMensaje.SetText('El expediente debe estar autorizado para realizar esta operación.');
                popMensajes.Show();
            }
        }

        function CerrarDesAutorizar() {
            popDesautorizar.Hide();
        }

        function DesAutorizar(s, e) {
            callback.PerformCallback("desautorizar");
            popDesautorizar.Hide();
        }

        function EndCallback(s, e) {
            if (e.result.toString() == "DesAprobado") {
                lblEstadoSocio.SetText("Finalizado");
                lblEstadoSocio.GetMainElement().style.background = 'Yellow';
                lblEstadoSocio.GetMainElement().style.color = 'Orange';
            } else {
                if (e.result.toString() == "Aprobado") {
                    lblEstadoSocio.SetText(e.result.toString());
                    lblEstadoSocio.GetMainElement().style.background = 'Green';
                    lblEstadoSocio.GetMainElement().style.color = 'White';
                } else {
                    if (e.result.toString() == "Membresia") {

                    } else {
                        txtMensaje.SetText(e.result.toString());
                        popMensajes.Show();
                    }
                }
            }
        }

        //function EndCallback(s, e) {
        //    if (e.result.toString() == "Aprobado") {
        //        lblEstadoSocio.SetText(e.result.toString());
        //        lblEstadoSocio.GetMainElement().style.background = 'Green';
        //        lblEstadoSocio.GetMainElement().style.color = 'White';
        //    } else {
        //        txtMensaje.SetText(e.result.toString());
        //        popMensajes.Show();
        //    }
        //}


        function OnCorporacionEndCallback(s, e) {
            if (s.cpError) {
                alert(s.cpError);
            }
        }

        function OnPaisOperaEndCallback(s, e) {
            if (s.cpError) {
                alert(s.cpError);
            }
        }

        /*  Cambio de membresia */
        function MostrarPopCambiarMembresia(s, e) {
            popAprobacion.SetHeaderText("Cambiar Membresia");
            btnAprobarSocio.SetText("Cambiar");
            popAprobacion.Show();
        }

        function CambiarMembresia(s, e) {
            callback.PerformCallback("cambiarmembresia");
            popAprobacion.Hide();
        }

        function SeleccionarOperacion(s,e) {
            if (btnAprobarSocio.GetText() == "Aprobar")
                Aprobar(s, e);
            else
                CambiarMembresia(s, e);
        }

    </script>

    <div class="contenido">
        <div style="float: left; width: 150px; height: 100%">
            <dx:ASPxTabControl ID="tabPerfiles" runat="server" ActiveTabIndex="3" EnableTheming="True" Theme="Material" TabPosition="Left" Height="100%">
                <Tabs>
                    <dx:Tab Name="tabGenerales" Text="Generales" NavigateUrl="~/PerfilSocioGenerales.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabContactos" Text="Contactos" NavigateUrl="~/PerfilSocioContactos.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabExportacion" Text="Exportación" NavigateUrl="~/PerfilSocioExportacion.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabMercado" Text="Mercado" NavigateUrl="~/PerfilSocioMercado.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabCertificacion" Text="Certificación" NavigateUrl="~/PerfilSocioCertificacion.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabComprador" Text="Comprador" NavigateUrl="~/PerfilSocioComprador.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabAdjuntos" Text="Adjuntos" NavigateUrl="~/PerfilSocioAdjuntos.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabProductos" Text="Productos" NavigateUrl="~/PerfilSocioProductos.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                </Tabs>
            </dx:ASPxTabControl>
        </div>

        <div style="float: left; width: 85%; overflow: auto">
            <dx:ASPxFormLayout ID="flyPerfilSocio" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
                AlignItemCaptionsInAllGroups="True" Theme="Moderno" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="None" UseDefaultPaddings="False" ColCount="3">
                        <Items>
                            <dx:LayoutItem Caption="Avance" ShowCaption="False" HorizontalAlign="Left">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <div style="clear: both">
                                            <dx:ASPxLabel ID="lblHeader" runat="server" Text="Perfil de Socio" Theme="Moderno" CssClass="header">
                                            </dx:ASPxLabel>
                                        </div>
                                        <div style="float: left">
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 1 de 7 - Datos Generales de la Empresa" CssClass="headerStep">
                                            </dx:ASPxLabel>
                                        </div>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Avance" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxProgressBar ID="pbAvance" runat="server" CustomDisplayFormat="" Maximum="7" Minimum="0" Theme="Material"
                                            Width="100px" DisplayFormatString="0">
                                        </dx:ASPxProgressBar>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Estado">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxLabel ID="lblEstadoSocio" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="White" CssClass="Estado" ClientInstanceName="lblEstadoSocio">
                                            <Border BorderStyle="Solid" BorderWidth="1px"></Border>
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="3" ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMenu ID="mnuHeaderTools" runat="server" BackColor="White" EnableAdaptivity="True" ItemLinkMode="TextAndImage" SkinID="None">
                                            <Items>
                                                <dx:MenuItem Name="itemNota" NavigateUrl="javascript:CrearNota()" Text="Crear Nota">
                                                    <Image Url="Content/Images/Nota.png">
                                                    </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="itemAutorizar" NavigateUrl="javascript:MostrarPopAprobacion()" Text="Autorizar">
                                                    <Image Url="Content/Images/Autorizar.png">
                                                    </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="itemDesautorizar" NavigateUrl="javascript:MostrarPopupDesautorizar()" Text="Remover Autorización" ToolTip="Remover el estado de autorizacion">
                                                    <Image Url="Content/Images/Desautorizar.png">
                                                    </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="itemCambiarMembresia" NavigateUrl="javascript:MostrarPopCambiarMembresia()" Text="Membresia" ToolTip="Cambiar Membresia">
                                                    <Image Url="Content/Images/Membresia.png">
                                                    </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="itemRegresar" NavigateUrl="FormSocioLista.aspx" Text="Regresar">
                                                    <Image Url="~/IMG/Regresar.png">
                                                    </Image>
                                                </dx:MenuItem>
                                            </Items>
                                            <Border BorderStyle="None" />
                                        </dx:ASPxMenu>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="Datos Generales" GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False" Paddings-PaddingTop="1px">
                        <Paddings PaddingTop="1px"></Paddings>
                        <Items>
                            <dx:LayoutItem Caption="Nombre:">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtNombreEmpresa" runat="server" Theme="Moderno" Width="400px" ClientInstanceName="txtNombreEmpresa" ReadOnly="True">
                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="main">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Dirección:">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtDireccionEmpresa" runat="server" Theme="Moderno" Width="400px" ClientInstanceName="txtDireccionEmpresa" BackColor="#FFFFCC" ReadOnly="True">
                                            <%--                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>--%>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Página Web:">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtPaginaWebEmpresa" runat="server" Theme="Moderno" Width="400px" ClientInstanceName="txtPaginaWebEmpresa">
                                            <%--                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>--%>
                                            <ValidationSettings ValidationGroup="main">
                                                <RegularExpression ErrorText="Dirección inválida" ValidationExpression="(http(s)?://)?([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Números de Teléfono:">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtTelefonosEmpresa" runat="server" Theme="Moderno" ClientInstanceName="txtTelefonosEmpresa">
                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="main">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Año de Fundación:">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtAnioEmpresa" runat="server" Theme="Moderno">
                                            <%--  <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>--%>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Numero de Empleados:">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtNumeroEmpleados" runat="server" Theme="Moderno">
                                            <%--                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>--%>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Skype de la Empresa:">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtSkypeEmpresa" runat="server" Theme="Moderno" Width="400px">
                                            <%--                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>--%>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Su empresa opera en otro pais?">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxRadioButtonList ID="rblOperaOtroEmpresaPais" runat="server" ClientInstanceName="rblOperaOtroEmpresaPais" RepeatDirection="Horizontal" SelectedIndex="0" Theme="Moderno">
                                            <ClientSideEvents SelectedIndexChanged="OnOperaOtroPaisChanged" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="S" />
                                                <dx:ListEditItem Text="No" Value="N" />
                                            </Items>
                                            <Border BorderStyle="None" />
                                        </dx:ASPxRadioButtonList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:TabbedLayoutGroup ClientInstanceName="tlgOperaOtroPais" ShowGroupDecoration="False" Width="100%">
                                <ClientSideEvents Init="OnTabOperaOtroPaisInit" />
                                <Items>
                                    <dx:LayoutGroup GroupBoxDecoration="None">
                                        <Items>
                                            <dx:LayoutItem Caption="" ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">

                                                        <dx:ASPxGridView ID="gridOperaOtroPais" runat="server" ClientInstanceName="gridOperaOtroPais" Theme="Moderno" AutoGenerateColumns="False" Width="100%"
                                                            KeyFieldName="IdPaisOpera" OnRowDeleting="gridOperaOtroPais_RowDeleting" OnRowInserting="gridOperaOtroPais_RowInserting" OnRowUpdating="gridOperaOtroPais_RowUpdating"
                                                            OnAfterPerformCallback="gridOperaOtroPais_AfterPerformCallback" OnCellEditorInitialize="gridOperaOtroPais_CellEditorInitialize">
                                                            <SettingsPager PageSize="5">
                                                            </SettingsPager>
                                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
                                                            </SettingsEditing>
                                                            <SettingsBehavior ConfirmDelete="True" />
                                                            <SettingsCommandButton>
                                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                                <NewButton Text="Nuevo" RenderMode="Button">
                                                                    <Image Url="~/IMG/Nuevo.png" ToolTip="Crear un nuevo registro"></Image>
                                                                </NewButton>
                                                                <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
                                                                <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
                                                                <EditButton Text="Editar" RenderMode="Button">
                                                                    <Image Url="~/IMG/Editar.png"></Image>
                                                                </EditButton>
                                                                <DeleteButton Text="Anular" RenderMode="Button">
                                                                    <Image Url="~/IMG/Borrar.png"></Image>
                                                                </DeleteButton>
                                                                <ClearFilterButton>
                                                                    <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
                                                                </ClearFilterButton>
                                                            </SettingsCommandButton>
                                                            <Columns>
                                                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="6" Width="50px">
                                                                </dx:GridViewCommandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Dirección" FieldName="Direccion" Name="Direcion" ShowInCustomizationForm="True" VisibleIndex="2" Width="120px">
                                                                    <PropertiesTextEdit MaxLength="100">
                                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                                            <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Teléfono" FieldName="NumeroTelefono" Name="NumeroTelefono" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                                                    <PropertiesTextEdit MaxLength="50">
                                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                                            <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Contacto" FieldName="NombreContacto" Name="Contacto" ShowInCustomizationForm="True" VisibleIndex="4" Width="120px">
                                                                    <PropertiesTextEdit MaxLength="100">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Operación" FieldName="DescripcionOperacion" Name="Operacion" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit HelpText="Describa la operación que realiza" MaxLength="200">
                                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                                            <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataComboBoxColumn Caption="País" FieldName="IdPais" Name="IdPais" ShowInCustomizationForm="True" VisibleIndex="1" Width="250px" Visible="False">
                                                                    <EditFormSettings Visible="True" />
                                                                </dx:GridViewDataComboBoxColumn>
                                                                <dx:GridViewCommandColumn Caption="Anular" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="120px">
                                                                </dx:GridViewCommandColumn>
                                                                <dx:GridViewDataTextColumn Caption="País" FieldName="NombrePais" Name="NombrePais" ShowInCustomizationForm="True" VisibleIndex="0" Width="120px">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <ClientSideEvents EndCallback="OnPaisOperaEndCallback"></ClientSideEvents>
                                                        </dx:ASPxGridView>

                                                        <%--<dx:ASPxComboBox ID="cmbOperaOtroPais" runat="server" TextField="NombrePais" Theme="Moderno" ValueField="IdPais" Width="400px">
                                                        </dx:ASPxComboBox>--%>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <%-- <dx:LayoutItem Caption="Dirección">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="txtOperaDireccion" runat="server" Theme="Moderno" Width="400px">
                                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="main">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Número de Teléfono">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="txtOperaTelefono" runat="server" Theme="Moderno">
                                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="main">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Contacto">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="txtOperaContacto" runat="server" Theme="Moderno" Width="400px">
                                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="main">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Describa operación:">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="txtOperaDescripcion" runat="server" Theme="Moderno" Width="400px">
                                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="main">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>--%>
                                        </Items>
                                        <SettingsItemCaptions HorizontalAlign="Right" Location="Left" />
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup GroupBoxDecoration="None">
                                        <SettingsItemCaptions HorizontalAlign="Right" Location="Left" />
                                    </dx:LayoutGroup>
                                </Items>
                            </dx:TabbedLayoutGroup>
                            <dx:LayoutItem Caption="Pertenece a una corporación?">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxRadioButtonList ID="rblCorporacion" runat="server" ClientInstanceName="rblCorporacion" RepeatDirection="Horizontal" SelectedIndex="0" Theme="Moderno">
                                            <ClientSideEvents SelectedIndexChanged="OnCorporacionChanged" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="S" />
                                                <dx:ListEditItem Text="No" Value="N" />
                                            </Items>
                                            <Border BorderStyle="None" />
                                        </dx:ASPxRadioButtonList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:TabbedLayoutGroup ClientInstanceName="tlgCorporacion" ShowGroupDecoration="False" Width="100%">
                                <ClientSideEvents Init="OnTabCorporacionInit" />
                                <Items>
                                    <dx:LayoutGroup GroupBoxDecoration="None">
                                        <Items>
                                            <dx:LayoutItem Caption="Nombre de Corporación:" ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="gridCorporacion" runat="server" ClientInstanceName="gridCorporacion" Theme="Moderno" AutoGenerateColumns="False" Width="100%"
                                                            KeyFieldName="IdSocioCorporacion" OnRowDeleting="gridCorporacion_RowDeleting" OnRowInserting="gridCorporacion_RowInserting" OnRowUpdating="gridCorporacion_RowUpdating" OnAfterPerformCallback="gridCorporacion_AfterPerformCallback">
                                                            <SettingsPager PageSize="5">
                                                            </SettingsPager>
                                                            <SettingsBehavior ConfirmDelete="True" />
                                                            <SettingsCommandButton>
                                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                                <NewButton Text="Nuevo" RenderMode="Button">
                                                                    <Image Url="~/IMG/Nuevo.png" ToolTip="Crear un nuevo registro"></Image>
                                                                </NewButton>
                                                                <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
                                                                <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
                                                                <EditButton Text="Editar" RenderMode="Button">
                                                                    <Image Url="~/IMG/Editar.png"></Image>
                                                                </EditButton>
                                                                <DeleteButton Text="Anular" RenderMode="Button">
                                                                    <Image Url="~/IMG/Borrar.png"></Image>
                                                                </DeleteButton>
                                                                <ClearFilterButton>
                                                                    <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
                                                                </ClearFilterButton>
                                                            </SettingsCommandButton>
                                                            <Columns>
                                                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="5" Width="50px">
                                                                </dx:GridViewCommandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Corporación" FieldName="NombreCorporacion" Name="NombreCorporacion" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit MaxLength="150">
                                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                                            <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewCommandColumn Caption="Anular" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="6" Width="120px">
                                                                </dx:GridViewCommandColumn>
                                                            </Columns>
                                                            <ClientSideEvents EndCallback="OnCorporacionEndCallback"></ClientSideEvents>
                                                        </dx:ASPxGridView>
                                                        <%-- <dx:ASPxTextBox ID="txtNombreCorporacion" runat="server" Theme="Moderno" Width="400px">
                                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="main">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>--%>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                        <SettingsItemCaptions HorizontalAlign="Right" Location="Left" />
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup GroupBoxDecoration="None">
                                        <SettingsItemCaptions HorizontalAlign="Right" Location="Left" />
                                    </dx:LayoutGroup>
                                </Items>
                            </dx:TabbedLayoutGroup>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Left">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <div style="float: left; display: inline">
                                            <dx:ASPxButton ID="btnSiguiente" runat="server" Text="Siguiente" Theme="Moderno" AutoPostBack="False">
                                                <ClientSideEvents Click="Siguiente"></ClientSideEvents>
                                            </dx:ASPxButton>
                                        </div>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                </Items>
                <Styles>
                    <LayoutGroupBox>
                        <Caption CssClass="layoutGroupBoxCaption"></Caption>
                    </LayoutGroupBox>
                </Styles>
            </dx:ASPxFormLayout>

        </div>

    </div>

    <dx:ASPxCallback ID="callback" runat="server" ClientInstanceName="callback" OnCallback="callback_Callback">
        <ClientSideEvents CallbackComplete="EndCallback"></ClientSideEvents>

    </dx:ASPxCallback>

    <dx:ASPxPopupControl ID="popMensajes" runat="server" CloseAction="CloseButton" HeaderText="Notificación de Mensajes"
        Modal="True" Theme="Moderno" Width="500px" ClientSideEvents="popMensajes" ClientInstanceName="popMensajes" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div style="clear: both">
                    <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Theme="Moderno" Width="100%" ClientInstanceName="txtMensaje">
                        <Border BorderStyle="None" />
                    </dx:ASPxMemo>
                </div>
                <div style="width: 120px; margin: 0 auto;">
                    <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" Theme="Moderno" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {popMensajes.Hide(); }"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="popAprobacion" HeaderText="Aprobación de Socio" CloseAction="CloseButton"
        runat="server" ClientInstanceName="popAprobacion" AllowDragging="True" EnableViewState="False"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" EnableHierarchyRecreation="True" Modal="True" Theme="Moderno">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxFormLayout ID="flyAprobacion" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
                    AlignItemCaptionsInAllGroups="true" Width="100%" Theme="Moderno">
                    <Items>
                        <dx:LayoutGroup Caption="" GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False">
                            <Items>
                                <dx:LayoutItem Caption="Membresia">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxComboBox ID="cmbTipoServicio" runat="server" ClientInstanceName="cmbTipoServicio" Theme="Moderno" Width="350px">
                                                <Items>
                                                    <dx:ListEditItem Text="Gratuita" Value="G" />
                                                    <dx:ListEditItem Text="Pagada" Value="P" />
                                                </Items>
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxButton ID="btnAprobarSocio" runat="server" Text="Aprobar" AutoPostBack="False" Theme="Moderno" ClientInstanceName="btnAprobarSocio"
                                                CausesValidation="False">
                                                <ClientSideEvents Click="SeleccionarOperacion"></ClientSideEvents>
                                            </dx:ASPxButton>

                                            <dx:ASPxButton ID="btnCerrarAprobacion" runat="server" Text="Cerrar" AutoPostBack="False" Theme="Moderno" ClientInstanceName="btnCerrarAprobacion"
                                                CausesValidation="False">
                                                <ClientSideEvents Click="CerrarAprobacion"></ClientSideEvents>
                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                            <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                        </dx:LayoutGroup>
                    </Items>
                    <Styles>
                        <LayoutGroupBox>
                            <Caption CssClass="layoutGroupBoxCaption"></Caption>
                        </LayoutGroupBox>
                    </Styles>
                </dx:ASPxFormLayout>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="popDesautorizar" runat="server" CloseAction="CloseButton" HeaderText="Autoirzación"
        Modal="True" Theme="Moderno" Width="400px" ClientInstanceName="popDesautorizar" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div>
                    <span>Confirma remover el estado de autorización de este expediente?</span>

                </div>
                <div style="padding-top: 15px;">
                    <div style="float: right; padding-right: 10px">
                        <dx:ASPxButton ID="btnCancelarDesautorizar" runat="server" Text="Cancelar" AutoPostBack="False">
                            <ClientSideEvents Click="CerrarDesAutorizar"></ClientSideEvents>
                        </dx:ASPxButton>
                    </div>

                    <div style="float: right; padding-right: 10px">
                        <dx:ASPxButton ID="btnDesautorizar" runat="server" Text="Aceptar" AutoPostBack="False">
                            <ClientSideEvents Click="DesAutorizar"></ClientSideEvents>
                        </dx:ASPxButton>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


</asp:Content>
