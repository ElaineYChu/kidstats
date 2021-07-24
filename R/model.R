# set xcalc for use by the model
xcalc <- seq(0, 23, by = .01)

# model_all_pool <- readRDS("models/model_limited_var_all_pop_all_sex.rds")
# model_all_M <- readRDS("models/model_limited_var_all_pop_male.rds")
# model_all_F <- readRDS("models/model_limited_var_all_pop_female.rds")
# model_us_pool <- readRDS("models/model_limited_var_US_all_sex.rds")
# model_us_M <- readRDS("models/model_limited_var_US_male.rds")
# model_us_F <- readRDS("models/model_limited_var_US_female.rds")

# load available univariate and multivariate models

## Helper function to generate model's file path
# refsamp = input$refsamp
# var_pattern = single variable abbreviation OR multivariate identifier
# model_type = either "univariate" or "multivariate"
find_model_path <- function(refsamp, var_pattern, model_type) { # sexsamp currently not available
  folder_path <- file.path("models", refsamp, model_type)
  file_name <- list.files(folder_path, pattern=var_pattern)
  file_path <- file.path(folder_path, file_name)
  
  return(file_path)
}

## Helper function to load correct model
# case_data = case_data
# refsamp = input$refsamp
choose_model <- function(case_data, refsamp) { # sexsamp currently not available
  var_names <- names(case_data)
  
  if(length(var_names) == 1) {
    file_name <- find_model_path(refsamp, var_names, "univariate")
  } else {  # this is where you add more multivariate options if available
    # if(length(var_names) == 6) {
      file_name <- find_model_path(refsamp, "six_var", "multivariate")
    # } else {
    #   file_name <- find_model_path(refsamp, "full_model", "multivariate")
    # }
  }
  
  model <- readRDS(file_name)
  return(model)
}

load_th_x <- function(refsamp) {
  folder_path <- file.path("models",refsamp)
  file_name <- list.files(folder_path, pattern="solutionx_")
  file_path <- file.path(folder_path, file_name)
  th_x <- readRDS(file_path)
  
  return(th_x)
}

choose_var_info <- function(refsamp) {
  folder_path <- file.path("www","csv")
  file_name <- list.files(folder_path, pattern=paste0(refsamp,"_var_info"))
  file_path <- file.path(folder_path, file_name)
  return(file_path)
}

# univariate_list <- list(
#   US = list (
#     pool = list(
#       model_us_pool_FDL = readRDS("models/univariate/solutiony_US_cindep_cont_k_1_FDL_pow_law_lin_pos_int.rds"),
#       model_us_pool_FMSB = readRDS("models/univariate/solutiony_US_cindep_cont_k_2_FMSB_pow_law_lin_pos_int.rds"),
#       model_us_pool_FDB = readRDS("models/univariate/solutiony_US_cindep_cont_k_3_FDB_pow_law_lin_pos_int.rds"),
#       model_us_pool_TDL = readRDS("models/univariate/solutiony_US_cindep_cont_k_4_TDL_pow_law_lin_pos_int.rds"),
#       model_us_pool_TPB = readRDS("models/univariate/solutiony_US_cindep_cont_k_5_TPB_pow_law_lin_pos_int.rds"),
#       model_us_pool_TMSB = readRDS("models/univariate/solutiony_US_cindep_cont_k_6_TMSB_pow_law_lin_pos_int.rds"),
#       model_us_pool_TDB = readRDS("models/univariate/solutiony_US_cindep_cont_k_7_TDB_pow_law_lin_pos_int.rds"),
#       model_us_pool_FBDL = readRDS("models/univariate/solutiony_US_cindep_cont_k_8_FBDL_pow_law_lin_pos_int.rds"),
#       model_us_pool_HDL = readRDS("models/univariate/solutiony_US_cindep_cont_k_9_HDL_pow_law_lin_pos_int.rds"),
#       model_us_pool_HPB = readRDS("models/univariate/solutiony_US_cindep_cont_k_10_HPB_pow_law_lin_pos_int.rds"),
#       model_us_pool_HMSB = readRDS("models/univariate/solutiony_US_cindep_cont_k_11_HMSB_pow_law_lin_pos_int.rds"),
#       model_us_pool_HDB = readRDS("models/univariate/solutiony_US_cindep_cont_k_12_HDB_pow_law_lin_pos_int.rds"),
#       model_us_pool_RDL = readRDS("models/univariate/solutiony_US_cindep_cont_k_13_RDL_pow_law_lin_pos_int.rds"),
#       model_us_pool_RPB = readRDS("models/univariate/solutiony_US_cindep_cont_k_14_RPB_pow_law_lin_pos_int.rds"),
#       model_us_pool_RMSB = readRDS("models/univariate/solutiony_US_cindep_cont_k_15_RMSB_pow_law_lin_pos_int.rds"),
#       model_us_pool_RDB = readRDS("models/univariate/solutiony_US_cindep_cont_k_16_RDB_pow_law_lin_pos_int.rds"),
#       model_us_pool_UDL = readRDS("models/univariate/solutiony_US_cindep_cont_k_17_UDL_pow_law_lin_pos_int.rds"),
#       model_us_pool_UMSB = readRDS("models/univariate/solutiony_US_cindep_cont_k_18_UMSB_pow_law_lin_pos_int.rds"),
#       model_us_pool_FH = readRDS("models/univariate/solutiony_US_cindep_ord_j_1_FH_EF_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_FGT = readRDS("models/univariate/solutiony_US_cindep_ord_j_2_FGT_EF_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_FLT = readRDS("models/univariate/solutiony_US_cindep_ord_j_3_FLT_EF_pow_law_ord_const.rds"),
#       model_us_pool_FDE = readRDS("models/univariate/solutiony_US_cindep_ord_j_4_FDE_EF_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_TPE = readRDS("models/univariate/solutiony_US_cindep_ord_j_5_TPE_EF_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_TDE = readRDS("models/univariate/solutiony_US_cindep_ord_j_6_TDE_EF_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_FBPE = readRDS("models/univariate/solutiony_US_cindep_ord_j_7_FBPE_EF_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_FBDE = readRDS("models/univariate/solutiony_US_cindep_ord_j_8_FBDE_EF_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_HH = readRDS("models/univariate/solutiony_US_cindep_ord_j_9_HH_Oss_lin_ord_lin_pos_int.rds"),
#       model_us_pool_HME = readRDS("models/univariate/solutiony_US_cindep_ord_j_1_HME_EF_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_TC = readRDS("models/univariate/solutiony_US_cindep_ord_j_2_TC_Oss_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_max_M1 = readRDS("models/univariate/solutiony_US_cindep_ord_j_3_max_M1_pow_law_ord_lin_pos_int.rds"),
#       model_us_pool_man_I2 = readRDS("models/univariate/solutiony_US_cindep_ord_j_4_man_I2_pow_law_ord_const.rds")
#     )
#   )
#   
# )
# 
# multivariate_list <- list(
#   us = list(
#     pooled = list(
#       model_us_pool_six_var = readRDS("models/multivariate/")
#     )
#   )
# )





# Function that chooses model based on user inputs
# choose_model <- function(case_data) {
#   var_names <- names(case_data)
#   if(length(var_names) == 1) {
#     var_idx <- grep(var_names, names(model_list))
#     model <- model_list[[var_idx]]
#   } else {
#     #if(length(var_names) == 6) {
#       model <- model_list[[7]]
#     #}
#   }
#   
#   return(model)
# }




# choose_model <- function(samp = NA, sex = NA) {
#   result <- NA
#   if (is.na(samp) || is.na(sex)) return(result)
#   code <- paste(samp, sex, sep = "_")
#   result <- switch(code,
#                    # "all_pool" = model_all_pool,
#                    # "all_M" = model_all_M,
#                    # "all_F" = model_all_F,
#                    # "us_pool" = model_us_pool,
#                    # "us_M" = model_us_M,
#                    # "us_F" = model_us_F
#                    us_six_var_pool = model_us_pool_six_var,
#                    us_FDL_pool = model_us_pool_FDL,
#                    us_RDL_pool = model_us_pool_RDL,
#                    us_HME_pool = model_us_pool_HME,
#                    us_TC_pool = model_us_pool_TC,
#                    us_max_M1_pool = model_us_pool_max_M1,
#                    us_man_I2_pool = model_us_pool_man_I2
#                    )
#   
#   return(result)
# }