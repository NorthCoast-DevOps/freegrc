#!/bin/zsh

# Check if shell is bash or zsh
if [ -n "$BASH_VERSION" ]; then
    echo "Running in bash"
elif [ -n "$ZSH_VERSION" ]; then
    echo "Running in zsh"
else
    echo "Unsupported shell. Please use bash or zsh."
    exit 1
fi

# Define the directory structure with subcategories as an array of categories
categories=(
    "Policies:IT_Security_Policies Data_Privacy_Policies Incident_Response_Policies Acceptable_Use_Policies Access_Control_Policies"
    "Standards:Security_Standards Data_Handling_and_Classification_Standards Network_and_Infrastructure_Standards Compliance_Standards"
    "Procedures:Incident_Response_Procedures Risk_Assessment_Procedures Change_Management_Procedures Business_Continuity_and_Disaster_Recovery_Procedures"
    "Guidelines:Security_Awareness_Guidelines Vendor_Management_Guidelines Cloud_Security_Guidelines Endpoint_Security_Guidelines"
    "Risk_Management:Risk_Assessment_Templates Risk_Register_Templates Control_and_Mitigation_Measures Risk_Assessment_Matrix_and_Criteria"
    "Compliance_and_Audit:Compliance_Checklists Internal_Audit_Checklists Self_Assessment_Forms Regulatory_Mapping"
    "Security_Controls:Access_Controls Physical_Security_Controls Network_Security_Controls Data_Security_Controls"
    "Training_and_Awareness:Security_Awareness_Training_Materials Phishing_Awareness_Resources Compliance_Training_Programs Secure_Development_Training_Materials"
    "Templates_and_Forms:Policy_Templates Risk_Assessment_Forms Incident_Reporting_Forms Vendor_Assessment_Forms"
    "Resources_and_Tools:GRC_Tools_and_Scripts Assessment_and_Audit_Tools Open-source_Security_Tools Checklists_and_Reference_Documents"
)

# Create directories and README.md files
for category_data in "${categories[@]}"; do
    # Separate category name from its subcategories
    category="${category_data%%:*}"
    subcategories="${category_data#*:}"

    # Create main category directory
    mkdir -p "$category"
    echo "# $category" > "$category/README.md"
    echo "This directory contains resources related to $category." >> "$category/README.md"
    
    # Create subcategory directories, using zsh array splitting
    IFS=' ' read -r -A subcategory_list <<< "$subcategories"
    for subcategory in "${subcategory_list[@]}"; do
        mkdir -p "$category/$subcategory"
        echo "# $subcategory" > "$category/$subcategory/README.md"
        echo "This directory contains resources related to $subcategory under $category." >> "$category/$subcategory/README.md"
    done
done

echo "Directory structure initialized with README.md files."
