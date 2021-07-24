# kidstats2 helpers.R

## This function is the displayed version in the UI ##
ks_version <- function(){
  return("0.2.0")
}

## Checks that not all of the entries are NA ##
not_all_na <- function(x) {
  !all(is.na(x))
}

## Selects only columns that are not empty (using not_all_na) ##
remove_empty_cols <- function(data) {
  result <- dplyr::select_if(data, not_all_na)
  return(result)
}



# UI Extensions: Functions used to add specific HTML attributes to UI elements #

# column_xs
column_xs <- function(width, ..., offset = 0)
{
  if (!is.numeric(width) || (width < 1) || (width > 12))
    stop("column width must be between 1 and 12")
  colClass <- paste0("col-xs-", width)
  if (offset > 0)
    colClass <- paste0(colClass, " col-xs-offset-")
  div(class = colClass, ...)
}

# add attributes to inputs
add_attribs <- function(tag, ..., type = "input") {
  switch(type,
         button = {
           tag$attribs <- c(tag$attribs, list(...))
         },
         input = {
           tag$children[[2]]$attribs <- c(tag$children[[2]]$attribs, list(...))
         },
         select = {
           tag$children[[2]]$children[[1]]$attribs <- c(tag$children[[2]]$children[[1]]$attribs, list(...))
         },
         numeric = {
           tag$children[[2]]$attribs <- c(tag$children[[2]]$attribs, list(...))
         },
         date = {
           tag$children[[2]]$attribs <- c(tag$children[[2]]$attribs, list(...))
         },
         radio = {
           tag$children[[2]]$attribs <- c(tag$children[[2]]$attribs, list(...))
         }
  )
  tag
}


######## Collapsing sides ###########
collapse_sides <- function(data, var_info) {
  # Extract full column names and final column names
  full_vec <- names(data)
  final_vec <- suppressWarnings(unique(stringr::str_remove_all(full_vec, "_L|_R")))
  no_lr_idx <- c()
  
  # Rename columns with only one side, switch approach to ""
  for(i in 1:length(final_vec)) {
    cur_idx <- grep(final_vec[i], full_vec)
    if(length(cur_idx) < 2) {
      names(data)[cur_idx] <- final_vec[i]
      no_lr_idx <- c(no_lr_idx, i)
    }
  }
  
  # Separate data into keep and merge sets
  keep_idx <- which(names(data) %in% final_vec[no_lr_idx])
  
  if(length(keep_idx) > 0) {
    keep_df <- data[keep_idx]
    merge_df <- data[-keep_idx]
  } else {
    keep_df <- c()
    merge_df <- data
  }
  
  if(length(merge_df) > 0){
    
    # Subset var_info to only merging variables
    if(length(no_lr_idx) > 0) {
      var_info_sub <- var_info[match(final_vec[-no_lr_idx], var_info$Variable),]
    } else {
      var_info_sub <- var_info[match(final_vec, var_info$Variable),]
    }
    
    
    left_label <- unique(var_info_sub$Left_Label)
    right_label <- unique(var_info_sub$Right_Label)
    label_side <- unique(var_info_sub$Left_Right_Side)
    
    # Apply yada function to merge
    merge_df <- yada::merge_multiple_lr_var(input_df=merge_df,
                                            base_var=var_info_sub$Variable,
                                            side_loc=label_side,
                                            side_labels=c(left_label, right_label),
                                            approach=var_info_sub$Left_Right_Approach)
    
    if(length(keep_df)>0) {
      temp_df <- cbind(keep_df, merge_df)
    } else {
      temp_df <- merge_df
    }

    result <- temp_df[match(final_vec, names(temp_df))]
  } else {
    result <- keep_df
  }
  
  return(result)
}

###### FILL IN NA FOR MULTIVARIATE MODELS #####
reorder_df <- function(case_data, var_names){
  new_df <- data.frame(matrix(NA, 1, length(var_names)))
  names(new_df) <- var_names
  
  for(i in var_names) {
    cur_var <- grep(i, names(case_data), value=TRUE)
    new_df[i] <- ifelse(length(cur_var)==0, NA, case_data[[cur_var]])
  }
  
  return(new_df)
}

# subsetLR <- function(s) {
#   N <- nchar(s)
#   return(substr(s, 1, N - 2))
# }
# 
# collapse_sides <- function(data, approach = "Prefer Left") {
#   varNames <- names(data)
# 
#   isLeft  <- grepl('*_L', varNames)
#   isRight <- grepl('*_R', varNames)
#   isLR <- isLeft | isRight
#   D <- data[,!isLR, drop = FALSE]
# 
#   leftVar  <- sapply(varNames[isLeft], subsetLR, USE.NAMES = F)
#   rightVar <- sapply(varNames[isRight], subsetLR, USE.NAMES = F)
#   lrVar <- unique(c(leftVar, rightVar))
#   two_sided <- lrVar[which(leftVar %in% rightVar)]
#   one_sided <- lrVar[-which(leftVar %in% rightVar)]
# 
#   if (length(lrVar >= 1)) {
#     for (ii in 1:length(lrVar)) {
#       # Assume both left and right variable columns exist
#       nL <- NULL
#       nR <- NULL
#       oL <- NULL
#       oR <- NULL
#       if (lrVar[ii] %in% two_sided) {
#       nL <- which(grepl(paste(lrVar[ii], '_L', sep = ''), varNames))
#       nR <- which(grepl(paste(lrVar[ii], '_R', sep = ''), varNames))
#       } else if (lrVar[ii] %in% leftVar ) {
#         oL <- which(grepl(paste(lrVar[ii], '_L', sep = ''), varNames))
#       } else {
#         oR <- which(grepl(paste(lrVar[ii], '_R', sep = ''), varNames))
#       }
# 
#       if (approach == 'Prefer Left') {
#             v <- data[,c(nL, oL, oR)]
#       } else if (approach == 'Prefer Right' ) {
#             v <- data[,c(nR, oR, oL)]
#       } else {
#         stop('Unsupported approach')
#       }
# 
#       newCol <- data.frame(as.integer(v))
#       colnames(newCol) <- lrVar[ii]
#       D <- cbind(D, newCol)
#     }
#   }
#   return(D)
# }


############# FROM MICHAEL PRICE ###############
# parseCategoryList <- function(catListFile) {
#   lns <- readLines(catListFile)
#   catList <- list()
#   J <- length(lns)/2
#   for (j in 1:J) {
#     # e.g., "FH_EF"
#     varName <- lns[1 + 2 * (j - 1)]
#     # .g., "0 1 12 2 23 3 4"
#     s       <- lns[2 + 2 * (j - 1)]
#     catList[[varName]] <- as.numeric(strsplit(s," ")[[1]])
#   }
#   return(catList)
# }
