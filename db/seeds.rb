# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Insert lifecycle
def insert_lifecycle(lifecycle_list)
    Lifecycle.destroy_all
    lifecycle_array = []
    lifecycle_list.each do|lifecycle|
        lifecycle_array.push(Lifecycle.create(:name => lifecycle))
    end
    return lifecycle_array
end

# Insert lifecycle phase
def insert_lifecycle_phase(lifecycles, lifecycle_phase_map)
    LifecyclePhase.destroy_all
    lifecycle_phase_list = []
    lifecycles.each do|lifecycle|
        lifecycle_phase_map[lifecycle.name].keys.each do |phase_key|
            lifecycle_phase_list.append(LifecyclePhase.create(:name => phase_key,
                                  :description => lifecycle_phase_map[lifecycle.name][phase_key],
                                  :lifecycle_id => lifecycle.id))
        end
    end
    return lifecycle_phase_list
end

# Insert deliverable type
def insert_deliverable_type(lifecycle_list, lifecycle_phase_list, deliverable_type_map, unit_of_measure_map)
    DeliverableType.destroy_all
    lifecycle_list.each do|lifecycle|
        lifecycle_phase_list.each do|lifecycle_phase|
            if deliverable_type_map[lifecycle][lifecycle_phase.name]
                deliverable_type_map[lifecycle][lifecycle_phase.name].each do|deliverable_type|
                    adhoc_deliverable = 0
                    if deliverable_type == "Other"
                        adhoc_deliverable = 1
                    end
                    # unit_of_measure_map = generate_uom_map()
                    unit_of_measure = unit_of_measure_map[deliverable_type]
                    DeliverableType.create(:name => deliverable_type,
                                           :lifecycle_phase_id => lifecycle_phase.id,
                                           :is_adhoc => adhoc_deliverable,
                                           :unit_of_measure => unit_of_measure)
                end
            end
        end
    end
end

def generate_uom_map(list_lines_of_code, list_pages, list_of_unit_of_measure)
    result = {}
    list_lines_of_code.each do |del_type|
      result[del_type] = list_of_unit_of_measure[1]
    end

    list_pages.each do |del_type|
      result[del_type] = list_of_unit_of_measure[0]
    end
    return result
end

list_pages = ["Architectural Design",
              "Architecture Design Doc",
              "Architecture document",
              "Contingency plan",
              "Deployment guide",
              "Description of functions and modules",
              "Design document",
              "Design plan",
              "document",
              "Initial plan",
              "Installation document",
              "Integration document",
              "Interface Design Doc",
              "Migration Document",
              "Test cases",
              "Project Description",
              "Project directory",
              "Project plan",
              "Project Scope",
              "Prototype",
              "Requirements document",
              "Scenarios",
              "Screenflow Design",
              "System Architecture design",
              "System Design Document",
              "Test Analysis Report",
              "Test case design document",
              "Test cases",
              "Testing results",
              "UI Mockups",
              "Use Cases",
              "Use cases",
              "User manual",
              "User Narrative",
              "User Requirements"]

list_lines_of_code = ["Code",
                      "Integration test",
                      "Integration tests",
                      "Project code",
                      "System test",
                      "Test code",
                      "Tests"]

list_of_unit_of_measure = ["pages", "lines of code"]

unit_of_measure_map = generate_uom_map(list_lines_of_code, list_pages, list_of_unit_of_measure)

# Running start here
lifecycle_list = ["Waterfall", "Rapid application development",
    "Spiral", "Iteractive and incremental development", "Agile development"]

lifecycle_phase_map = {
      lifecycle_list[0] => {
        "Requirements" => "Requirements analysis in systems
        engineering and software engineering, encompasses those tasks that go
        into determining the needs or conditions to meet for a new or altered product,
        taking account of the possibly conflicting requirements of the various stakeholders,
        analyzing, documenting, validating and managing software or system requirements.",

        "Software design" => "Software design is the process by which an agent creates
        a specification of a software artifact, intended to accomplish goals, using a set of
        primitive components and subject to constraints.[1] Software design may refer to either
        all the activities involved in conceptualizing, framing, implementing,
        commissioning, and ultimately modifying complex systems or the activity
        following requirements specification and before programming",

        "Implementation and Intergration" => "With inputs from system design,
        the system is first developed in small programs called units, which are integrated
        in the next phase. Each unit is developed and tested for its functionality
        which is referred to as Unit Testing.",

        "Testing" => "Software testing is an investigation conducted to provide
        stakeholders with information about the quality of the product or service under test.
        Software testing can also provide an objective, independent view of the software to
        allow the business to appreciate and understand the risks of software implementation.
        Test techniques include, but are not limited to the process of executing a program or
        application with the intent of finding software bugs (errors or other defects).",

        "Deployment" => "Software deployment is all of the activities that
        make a software system available for use.",

        "Maintenace" => "Software maintenance in software engineering is the modification of
        a software product after delivery to correct faults, to improve performance or
        other attributes."
      },
      lifecycle_list[1] => {
        "Requirements Planning" => "Combines elements of the system planning and systems
        analysis phases of the Systems Development Life Cycle (SDLC).
        Users, managers, and IT staff members discuss and agree on business needs,
        project scope, constraints, and system requirements. It ends when the team agrees
        on the key issues and obtains management authorization to continue.",

        "User Design" => "During this phase, users interact with systems analysts and
        develop models and prototypes that represent all system processes, inputs, and outputs.
        The RAD groups or subgroups typically use a combination of Joint Application Development
        (JAD) techniques and CASE tools to translate user needs into working models.",

        "Construction" => "Focuses on program and application development task similar to
        the SDLC. In RAD, however, users continue to participate and can still suggest changes
        or improvements as actual screens or reports are developed. Its tasks are programming
        and application development, coding, unit-integration and system testing.",

        "Cutover" => "Resembles the final tasks in the SDLC implementation phase,
        including data conversion, testing, changeover to the new system, and user training.
        Compared with traditional methods, the entire process is compressed.
        As a result, the new system is built, delivered, and placed in operation much sooner."
      },
      lifecycle_list[2] => {
        "Detailed design" => "Design phase starts with the conceptual design in the baseline
        spiral and involves architectural design, logical design of modules, physical product
        design and final design in the subsequent spirals.",

        "Code" => "Construct phase refers to production of the actual software product
        at every spiral. In the baseline spiral when the product is just thought of and the
        design is being developed a POC (Proof of Concept) is developed in this phase to get
        customer feedback.",

        "Intergration" => "All the units developed in the implementation phase are integrated
        into a system after testing of each unit. Post integration the entire system is tested
        for any faults and failures.",

        "Test" => "All the units developed in the implementation phase are integrated
        into a system after testing of each unit. Post integration the entire system is
        tested for any faults and failures.",

        "Implementation" => "Then in the subsequent spirals with higher clarity on
        requirements and design details a working model of the software called build is
        produced with a version number. These builds are sent to customer for feedback."
      },
      lifecycle_list[3] => {
        "Planning" => "Inception identifies project scope,
        requirements (functional and non-functional) and risks at a high level
        but in enough detail that work can be estimated.",

        "Requirements" => "Elaboration delivers a working architecture that mitigates
        the top risks and fulfills the non-functional requirements.",

        "Analysis & Design" => "Construction incrementally fills-in the architecture
        with production-ready code produced from analysis, design, implementation,
        and testing of the functional requirements.",

        "Implementation" => "Transition delivers the system into the production operating environment.",

        "Deployment" => "Software deployment is all of the activities that
        make a software system available for use.",

        "Testing" => "Software testing is an investigation conducted to provide
        stakeholders with information about the quality of the product or service under test.
        Software testing can also provide an objective, independent view of the software to
        allow the business to appreciate and understand the risks of software implementation.
        Test techniques include, but are not limited to the process of executing a program or
        application with the intent of finding software bugs (errors or other defects).",

        "Evaluation" => "Used to define, demonstrate, and predict how systems
        will perform under peak loads as well as to demonstrate and evaluate other
        non-functional aspects of the system (transaction rates, data storage volume,
                                              response time, etc.)"
      },
      lifecycle_list[4] => {
       "Iteration 0" => "First phase of Agile development",
       "Iteration 1" => "Iteration 1",
       "Iteration 2" => "Iteration 2",
       "Iteration 3" => "Iteration 3",
       "Iteration 4" => "Iteration 4"
      }
}

deliverable_type_list_waterfall_requirements = [
    "User Narrative", "User Requirements", "Project Scope", "Use Cases",
    "Architecture Design Doc", "Interface Design Doc", "UI Mockups",
    "Screenflow Design", "Other"
]

deliverable_type_list_waterfall_software_design = ["Design plan", "System Design Document", "System Architecture design
document", "Other"]

deliverable_type_list_waterfall_implementation_integration = ["Project directory", "Integration test", "Project Description
", "Other"]

deliverable_type_list_waterfall_testing = ["Test Analysis Report", "Test case design document", "Tests", "Other"]

deliverable_type_list_waterfall_deployment = ["Contingency plan", "Integration document", "User manual", "Other"]

deliverable_type_list_waterfall_maintenance = ["Change Implementation Notice", "Process Review Report", "Other"]

deliverable_type_list_RAD_requirements = ["Requirements document", "Project plan", "Project scope", "Other"]

deliverable_type_list_RAD_user_design =["Prototype", "Design document", "Other"]

deliverable_type_list_RAD_construction = ["Code", "Integration test", "System test", "Other"]

deliverable_type_list_RAD_cutover = ["Testing results", "User manual", "Migration Document", "Other"]

deliverable_type_list_spiral_detailed_design = ["Design document", "Architectural Design", "Other"]

deliverable_type_list_spiral_code = ["Project code", "Description of functions and modules", "Other"]

deliverable_type_list_spiral_integration = ["Integration tests", "Integration document", "Other"]

deliverable_type_list_spiral_test = ["Test cases", "Test code", "Other"]

deliverable_type_list_spiral_implementation = ["Deployment guide", "Installation document", "Other"]

deliverable_type_list_ii_planning = ["Initial plan", "Design plan", "Other"]

deliverable_type_list_ii_requirements = ["Requirements document", "Use cases", "Other"]

deliverable_type_list_ii_analysis_and_design = ["Architecture document", "Design document", "Other"]

deliverable_type_list_ii_implementation = ["Code", "Other"]

deliverable_type_list_ii_deployment = ["Installation document", "User manual", "Other"]

deliverable_type_list_ii_testing = ["Test cases", "Scenarios", "Test code", "Other"]

deliverable_type_list_agile_Iteration = ["User Narrative", "Test cases", "Code", "Requirements document", "Other" ]


deliverable_type_map = {
      lifecycle_list[0] => {
        "Requirements" => deliverable_type_list_waterfall_requirements,

        "Software design" => deliverable_type_list_waterfall_software_design,

        "Implementation and Intergration" => deliverable_type_list_waterfall_implementation_integration,

        "Testing" => deliverable_type_list_waterfall_testing,

        "Deployment" => deliverable_type_list_waterfall_deployment,

        "Maintenance" => deliverable_type_list_waterfall_maintenance
      },
      lifecycle_list[1] => {
        "Requirements Planning" => deliverable_type_list_RAD_requirements,

        "User Design" => deliverable_type_list_RAD_user_design,

        "Construction" => deliverable_type_list_RAD_construction,

        "Cutover" => deliverable_type_list_RAD_cutover
      },
      lifecycle_list[2] => {
        "Detailed design" => deliverable_type_list_spiral_detailed_design,

        "Code" => deliverable_type_list_spiral_code,

        "Intergration" => deliverable_type_list_spiral_integration,

        "Test" => deliverable_type_list_spiral_test,

        "Implementation" => deliverable_type_list_spiral_implementation
      },
      lifecycle_list[3] => {
        "Planning" => deliverable_type_list_ii_planning,

        "Requirements" => deliverable_type_list_ii_requirements,

        "Analysis & Design" => deliverable_type_list_ii_analysis_and_design,

        "Implementation" => deliverable_type_list_ii_implementation,

        "Deployment" => deliverable_type_list_ii_deployment,

        "Testing" => deliverable_type_list_ii_testing
      },
      lifecycle_list[4] => {
       "Iteration 0" => deliverable_type_list_agile_Iteration,
       "Iteration 1" => deliverable_type_list_agile_Iteration,
       "Iteration 2" => deliverable_type_list_agile_Iteration,
       "Iteration 3" => deliverable_type_list_agile_Iteration,
       "Iteration 4" => deliverable_type_list_agile_Iteration
      }
}

puts("+-------------------------------------------------------+")
puts("| Start to insert lifecycle...                          |")
list = insert_lifecycle(lifecycle_list)
puts("| Start to insert lifecycle phases...                   |")
lifecycle_phase_list = insert_lifecycle_phase(list, lifecycle_phase_map)
puts("| Start to insert deliverable types...                  |")
insert_deliverable_type(lifecycle_list, lifecycle_phase_list, deliverable_type_map, unit_of_measure_map)
puts("| Done!                                                 |")
puts("+-------------------------------------------------------+")

