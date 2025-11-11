*** Variables ***
##### Facility data #####
${TOKYO}            Tokyo CURA Healthcare Center
${HONGKONG}         Hongkong CURA Healthcare Center
${SEOUL}            Seoul CURA Healthcare Center

##### Hospital Readmission data #####
${WITH_READMISSION}     Yes
${WITHOUT_READMISSION}  No

##### Healthcare Program data #####
${MEDICARE}    Medicare
${MEDICAID}    Medicaid
${NONE}        None

##### Visit Date data #####
${VALID_VISIT_DATE}             03/05/2025
${INVALID_VISIT_DATE_FORMAT}    abcdef
${PAST_VISIT_DATE}              01/01/2020
${EMPTY_VISIT_DATE}             ${EMPTY}

##### Comment data #####
${NORMAL_COMMENT}         Health checking
${SPECIAL_CHAR_COMMENT}    ()*&^%$#@!
${EMPTY_COMMENT}          ${EMPTY}