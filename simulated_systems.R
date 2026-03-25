# simulated_systems.R
library(R6)

MockEHRSystem <- R6Class("MockEHRSystem",
                         public = list(
                           get_patient_history = function(patient_id) {
                             cat(sprintf("\n[EHR] Querying patient history for ID: %s...\n", patient_id))
                             # In a real system, this would be a secure API call.
                             return("
        Patient: John Appleseed, ID: P12345, DOB: 1965-01-15.
        Chief Complaint: Elevated PSA.
        History of Present Illness: 59-year-old male presents for urology follow-up. 
        Recent labs show a Prostate-Specific Antigen (PSA) level of 8.5 ng/mL, up from 4.2 ng/mL last year.
        No symptoms of nocturia or hematuria reported. Digital rectal exam was firm.
        Past Medical History: Hypertension (controlled with lisinopril), Hyperlipidemia.
        Surgical History: Appendectomy (1999).
        Family History: Father had prostate cancer at age 75.
        Radiology Reports: Abdominal CT (2023) showed no abnormalities. No recent pelvic MRI.
      ")
                           }
                         )
)

MockLIS <- R6Class("MockLIS",
                   public = list(
                     log = list(),
                     log_event = function(specimen_id, event) {
                       log_entry <- sprintf("%s: [Specimen %s] - %s", Sys.time(), specimen_id, event)
                       self$log <- c(self$log, log_entry)
                       cat(sprintf("[LIS] %s\n", log_entry))
                     }
                   )
)