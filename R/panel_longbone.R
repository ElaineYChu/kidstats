## panel_longbone.R ##

longbone_panel <- withTags({
  div(class = "col-xs-12 col-lg-9",
      div(class = "panel panel-primary",

          # panel header
          div(class = "panel-heading",
              splitLayout(cellWidths = c("95%", "5%"),
              a(href = "#longbone-panel", "data-toggle" = "collapse",
                h3(class = "panel-title", "Skeletal Metrics")
              ),
              actionLink("resetSkeletal", "", width = "auto", icon = icon("trash", lib = "glyphicon"))
          )),

          # panel body
          div(class = "collapse", id = "longbone-panel",
              div(class = "panel-body",
                fluidRow(
                  column_xs(width = 5,
                    ul(class = "nav nav-pills nav-stacked", role = "tablist",
                      li(role = "presentation", class = "active",
                         a(href = "#humerus", role = "tab", `data-toggle` = "pill", "Humerus")
                      ),
                      li(role = "presentation",
                         a(href = "#radius", role = "tab", `data-toggle` = "pill", "Radius")
                      ),
                      li(role = "presentation",
                         a(href = "#ulna", role = "tab", `data-toggle` = "pill", "Ulna")
                      ),
                      li(hr()),
                      li(role = "presentation",
                         a(href = "#femur", role = "tab", `data-toggle` = "pill", "Femur")
                      ),
                      li(role = "presentation",
                         a(href = "#tibia", role = "tab", `data-toggle` = "pill", "Tibia")
                      ),
                      li(role = "presentation",
                         a(href = "#fibula", role = "tab", `data-toggle` = "pill", "Fibula"))
                      # ),
                      # li(hr()),
                      # li(role = "presentation",
                      #    a(href = "#pelvis", role = "tab", `data-toggle` = "pill", "Pelvis")
                      # )
                    )
                  ),
                  column_xs(width = 7,
                    div(class = "tab-content",
                        div(
                          column_xs(width = 6, wellPanel("Left side", style = "padding: 10px")),
                          column_xs(width = 6, wellPanel("Right side", style = "padding: 10px"))
                        ),
                        div(role = "tabpanel", class = "tab-pane active fade in", id = "humerus",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("HDL_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("HDL_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("HMSB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("HMSB_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("HPB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("HPB_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("HDB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("HDB_R", NULL, value = NA, min = -1, width = "100%"))
                          #  ),
                          # h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   numericInput("HCB_L", NULL, value = NA, min = -1, width = "100%")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   numericInput("HCB_R", NULL, value = NA, min = -1, width = "100%")
                          #   ),
                          # h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   numericInput("HIB_L", NULL, value = NA, min = -1, width = "100%")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   numericInput("HIB_R", NULL, value = NA, min = -1, width = "100%")
                          #   )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "radius",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("RDL_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("RDL_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("RMSB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("RMSB_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("RPB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("RPB_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("RDB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("RDB_R", NULL, value = NA, min = -1, width = "100%"))
                          #  ),
                          # h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   add_attribs(numericInput("RCB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   add_attribs(numericInput("RCB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   add_attribs(numericInput("RIB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   add_attribs(numericInput("RIB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "ulna",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("UDL_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("UDL_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("UMSB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("UMSB_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("UPB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("UPB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("UDB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("UDB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly"))
                          #   ),
                          # h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   add_attribs(numericInput("UCB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   add_attribs(numericInput("UCB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   add_attribs(numericInput("UIB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   add_attribs(numericInput("UIB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "femur",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("FDL_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("FDL_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("FMSB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("FMSB_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FPB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FPB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("FDB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("FDB_R", NULL, value = NA, min = -1, width = "100%"))
                          #   ),
                          # h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   numericInput("FCB_L", NULL, value = NA, min = -1, width = "100%")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   numericInput("FCB_R", NULL, value = NA, min = -1, width = "100%")
                          #   ),
                          # h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   numericInput("FIB_L", NULL, value = NA, min = -1, width = "100%")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   numericInput("FIB_R", NULL, value = NA, min = -1, width = "100%")
                          #   )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "tibia",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("TDL_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("TDL_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("TMSB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("TMSB_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("TPB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("TPB_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("TDB_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("TDB_R", NULL, value = NA, min = -1, width = "100%"))
                          #   ),
                          # h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   add_attribs(numericInput("TCB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   add_attribs(numericInput("TCB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   add_attribs(numericInput("TIB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   add_attribs(numericInput("TIB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "fibula",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            numericInput("FBDL_L", NULL, value = NA, min = -1, width = "100%")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            numericInput("FBDL_R", NULL, value = NA, min = -1, width = "100%")
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FBMSB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FBMSB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FBPB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FBPB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FBDB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FBDB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")))
                          #   ),
                          # h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   add_attribs(numericInput("FBCB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   add_attribs(numericInput("FBCB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                          # column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                          #   add_attribs(numericInput("FBIB_L", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   ),
                          # column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                          #   add_attribs(numericInput("FBIB_R", NULL, value = NA, min = -1, width = "100%"), readonly = "readonly")
                          #   )
                        # ),
                        # 
                        # div(role = "tabpanel", class = "tab-pane fade", id = "pelvis",
                        #     h5(strong("Ilium height"), style = "margin-top: 0px; margin-bottom: 7px;"),
                        #     column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                        #       numericInput("PIH_L", NULL, value = NA, min = -1, width = "100%")
                        #       ),
                        #     column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                        #       numericInput("PIH_R", NULL, value = NA, min = -1, width = "100%")
                        #       ),
                        #     h5(strong("Ilium breadth"), style = "margin-top: 7px; margin-bottom: 7px;"),
                        #     column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                        #       numericInput("PIB_L", NULL, value = NA, min = -1, width = "100%")
                        #       ),
                        #     column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                        #       numericInput("PIB_R", NULL, value = NA, min = -1, width = "100%")
                        #     )
                        # )

                    )
                  )

                )
              )
          )
      )
  )
})
