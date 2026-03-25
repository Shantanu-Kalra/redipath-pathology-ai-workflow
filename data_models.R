# data_models.R
library(R6)

Specimen <- R6Class("Specimen",
                    public = list(
                      specimen_id = NULL,
                      patient_id = NULL,
                      specimen_type = NULL,
                      received_time = NULL,
                      status = NULL,
                      clinical_summary = "",
                      ai_image_findings = list(),
                      draft_report = "",
                      final_diagnosis = "",
                      
                      initialize = function(specimen_id, patient_id, specimen_type) {
                        self$specimen_id <- specimen_id
                        self$patient_id <- patient_id
                        self$specimen_type <- specimen_type
                        self$received_time <- Sys.time()
                        self$status <- "Received in Lab"
                      },
                      
                      update_status = function(new_status) {
                        self$status <- new_status
                        cat(sprintf("Specimen %s status updated to: '%s'\n", self$specimen_id, self$status))
                      }
                    )
)
