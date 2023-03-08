library(fs)
library(tools)



# Function to create directory structure from a list
create_dirs <- function(lst, path = NULL) {
  # If path is not given, use the current working directory
  if (is.null(path)) path <- getwd()
  
  # Loop over the elements of the list
  for (i in seq_along(lst)) {
    # Get the name of the current element
    name <- names(lst)[i]
    
    # If the current element is a subdirectory (list), create the directory and call create_dirs recursively
    if (is.list(lst[[i]])) {
      dir.create(file.path(path, name), showWarnings = FALSE)
      create_dirs(lst[[i]], file.path(path, name))
    } 
    # If the current element is a string, create the directory with that name
    else if (is.character(lst[[i]])) {
      dir.create(file.path(path, lst[[i]]), showWarnings = FALSE)
    }
  }
}

# Example structure:
folder_structure <- list(
  `01 Client Input` = NULL,
  `02 Budget` = list(
    `02.01 KV` = NULL,
    `02.02 AN` = NULL,
    `03.03 PO` = NULL,
    `04.04 RE` = NULL
  ),
  `03 Creative` = list(
    `03.01 Creative Materials` = NULL,
    `03.02 Moods` = NULL,
    `03.03 Styleframes` = NULL,
    `03.03 Open Files` = NULL
  ),
  `04 Concept and Storyboard` = NULL,
  `04 Timing` = NULL,
  `06 Documents` = list(
    `06.01 Contracts` = NULL,
    `06.02 Meeting Minutes` = NULL,
    `06.03 Reviews` = NULL,
    `06.04 Travel` = NULL
  ),
  `07 Shoot` = list(
    `07.01 Booklet` = NULL,
    `07.02 Callsheet` = NULL,
    `07.03 Shotlist` = NULL,
    `07.04 Director DoP` = NULL,
    `07.05 Cast` = list(
      Casting = NULL,
      Selects = NULL,
      `Final Cast` = NULL
    ),
    `07.06 Location` = NULL,
    `07.07 Set Design` = list(
      Set = NULL,
      Props = NULL
    ),
    `07.08 MakeUp` = NULL,
    `07.09 Styling` = NULL,
    `07.10 Foodstyling` = NULL,
    `07.11 Catering` = NULL,
    `07.12 Equipment` = list(
      Kamera = NULL,
      Licht = NULL
    ),
    `07.13 Transportation` = NULL
  ),
  `08 Material` = list(
    `08.01 Video` = NULL,
    `08.02 Audio` = NULL,
    `08.03 Photo` = NULL,
    `08.04 Graphic` = NULL,
    `08.05 Brand Assets` = NULL,
    `08.06 3D Assets` = NULL
  ),
  `09 Postproduction` = list(
    `09.01 Edit` = NULL,
    `09.02 Audio` = NULL,
    `09.03 Motion` = NULL,
    `09.04 Graphic Design` = NULL
  ),
  `10 Shared` = list(
    `10.01 Previews` = NULL,
    `10.02 Transfer` = NULL,
    `10.03 Collaboration` = NULL,
    `10.04 Deiveries` = NULL
  ),
  `11 Archiv` = NULL,
  `12 Final Master` = NULL
  )


# Define the parent directory where the folders should be created
parent_dir <- "./structure/"

# Define a recursive function to create the folders

# Define a recursive function to create the folders
create_folders <- function(dir, folders) {
  for (i in seq_along(folders)) {
    name <- names(folders)[i]
    path <- file.path(dir, name)
    dir_create(path)
    if (is.list(folders[[i]])) {
      create_folders(path, folders[[i]])
    }
  }
}

# Call the create_folders function to create the folders
create_folders(parent_dir, folder_structure)
