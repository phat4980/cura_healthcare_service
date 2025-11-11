*** Variables ***
#Input locators
${txt_visit_date}=   //*[@id='txt_visit_date']
${txt_comment}=   //*[@id='txt_comment']

#Button locators
${btn_book_appointment}=   //*[@id='btn-book-appointment']


#Elements locators
${elem_facility_dropdown}=   //*[@id='combo_facility']
${elem_hospital_readmission_checkbox}=   //*[@id='chk_hospotal_readmission']
${elem_prog_medicare_radiobtn}=   //*[@id='radio_program_medicare']
${elem_prog_medicaid_radiobtn}=   //*[@id='radio_program_medicaid']
${elem_prog_none_radiobtn}=   //*[@id='radio_program_none']
${elem_prog_none_radiobtn}=   //*[contains(text(),'Appointment Confirmation')]
${elem_confirmation_section}=   //section[@id='summary']//div[@class='row']

#Dropdown menu item locators
${elem_tokyo_healthcare_center}=   //*[@value='Tokyo CURA Healthcare Center']
${elem_hongkong_healthcare_center}=   //*[@value='Hongkong CURA Healthcare Center']
${elem_seoul_healthcare_center}=   //*[@value='Seoul CURA Healthcare Center']