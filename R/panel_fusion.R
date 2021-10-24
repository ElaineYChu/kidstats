## panel_fusion.R ##

fusion_panel <- withTags({
  div(class = "col-xs-12 col-lg-9",
      div(class = "panel panel-primary",

          # panel header
          div(class = "panel-heading",
              splitLayout(cellWidths = c("95%", "5%"), 
              a(href = "#fusion-panel", "data-toggle" = "collapse",
                h3(class = "panel-title", "Epiphyseal fusion and Ossification")
              ),
              actionLink("resetFusion", "", width = "auto", icon = icon("trash", lib = "glyphicon"))
          )),

          # panel body
          div(class = "collapse", id = "fusion-panel",
              div(class = "panel-body",
                  fluidRow(
                    column_xs(width = 12,
                              ul(class = "nav nav-pills", role = "tablist",
                                 li(role = "presentation", class = "active",
                                    a(href = "#humerus-ef", role = "tab", `data-toggle` = "pill", "Humerus")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#radius-ef", role = "tab", `data-toggle` = "pill", "Radius")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#ulna-ef", role = "tab", `data-toggle` = "pill", "Ulna")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#femur-ef", role = "tab", `data-toggle` = "pill", "Femur")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#tibia-ef", role = "tab", `data-toggle` = "pill", "Tibia")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#fibula-ef", role = "tab", `data-toggle` = "pill", "Fibula")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#other-ef", role = "tab", `data-toggle` = "pill", "Other")
                                 )
                              )
                    )
                  ),
                  hr(),
                  fluidRow(
                    column_xs(width = 12,
                              div(class = "tab-content",
                                  div(role = "tabpanel", class = "tab-pane active fade in", id = "humerus-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("HH_Oss_L", "Humeral head", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HH_Oss_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HGT_Oss_L", "Greater tubercle", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HGT_Oss_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HLT_Oss_L", "Lesser tubercle", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HLT_Oss_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("HPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HPE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HC_Oss_L", "Capitulum", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HC_Oss_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HT_Oss_L", "Trochlea", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HT_Oss_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("HLE_Oss_L", "Lateral epicondyle", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HLE_Oss_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        # add_attribs(selectInput("HDE_EF_L", "Distal epiphysis", choices = c("(Left)"="", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        # add_attribs(selectInput("HDE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HME_EF_L", "Medial epicondyle", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HME_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        # add_attribs(selectInput("HCE1_EF_L", "Composite epiphysis 1", choices = c("(Left)" = "", "Unfused (0)" = 0, "Fusing/Fused (1)" = 1), selectize = TRUE), type = "select"),
                                        # add_attribs(selectInput("HCE1_EF_R", NULL, choices = c("(Right)" = "", "Unfused (0)" = 0, "Fusing/Fused (1)" = 1), selectize = TRUE), type = "select"),
                                        # add_attribs(selectInput("HCE2_EF_L", "Composite epiphysis 2", choices = c("(Left)" = "", "Unfused (0)" = 0, "Fusing/Fused (1)" = 1), selectize = TRUE), type = "select"),
                                        # add_attribs(selectInput("HCE2_EF_R", NULL, choices = c("(Right)" = "", "Unfused (0)" = 0, "Fusing/Fused (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("HDE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "radius-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("RPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("RPE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("RDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("RDE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "ulna-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("UPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("UPE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("UDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("UDE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "femur-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("FH_EF_L", "Femoral head", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("FH_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("FGT_EF_L", "Greater trochanter", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("FGT_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("FLT_EF_L", "Lesser trochanter", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("FLT_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("FDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("FDE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "tibia-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("TPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("TPE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("TDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("TDE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "fibula-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("FBPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("FBPE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("FBDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("FBDE_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "other-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("CT_EF_L", "Calcaneal tuberosity", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("CT_EF_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1, "Early Active union (1/2)" = 12, "Active union (2)" = 2, "Active/Adv. union (2/3)" = 23, "Advanced union (3)" = 3, "Complete fusion (4)" = 4), selectize = TRUE), type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("CC_Oss", "Carpals (count)", choices = c("(Total)" = "", 0:8), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("TC_Oss", "Tarsals (count)", choices = c("(Total)" = "", 0:7), selectize = TRUE), type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("ISPR_EF_L", "Ischio-pubic ramus", choices = c("(Left)" = "", "No union (0)" = 0, "Partial union (1)" = 1, "Complete union (2)" = 2), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("ISPR_EF_R", NULL, choices = c("(Right)" = "", "No union (0)" = 0, "Partial union (1)" = 1, "Complete union (2)" = 2), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("ILIS_EF_L", "Ilium-ischium", choices = c("(Left)" = "", "No union (0)" = 0, "Partial union (1)" = 1, "Complete union (2)" = 2), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("ILIS_EF_R", NULL, choices = c("(Right)" = "", "No union (0)" = 0, "Partial union (1)" = 1, "Complete union (2)" = 2), selectize = TRUE), type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("PC_Oss_L", "Patella", choices = c("(Left)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select"),
                                        add_attribs(selectInput("PC_Oss_R", NULL, choices = c("(Right)" = "", "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE), type = "select")
                                      )
                                  )

                              )
                    )
                  )

              )
          )
      )
  )
})
