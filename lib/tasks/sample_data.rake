namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		# admin = User.create!(name: "Jianchen Tao",
		# 			email: "taojason@gmail.com",
		# 			password: "12345678",
		# 			password_confirmation: "12345678")
		# admin.toggle!(:admin)


		num_user = 100
		num_project = 100
		num_deliverable = 100

		num_root_project = 10
		num_root_deliverable = 10

		root_name = "jason tao"
		root_email = "taojason@example.com"
		root_password = "foobarar"
		User.create!(name: root_name,
					email: root_email,
					password: root_password,
					password_confirmation: root_password)

		num_user.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@pet.com"
			password = "password"
			User.create!(name: name,
						email: email,
						password: password,
						password_confirmation: password)
		end

		lifecycle_list = Lifecycle.all

		num_root_project.times do |n|
			project_name = Faker::Lorem.sentence(2)
			project_desc = Faker::Lorem.sentence(20)
			pro_lifecycle_id = lifecycle_list[rand(5)].id
			user_id =  1
			Project.create!(name: project_name,
							description: project_desc,
							lifecycle_id: pro_lifecycle_id,
							user_id: user_id)
		end
		
		num_project.times do |n|
			project_name = Faker::Lorem.sentence(2)
			project_desc = Faker::Lorem.sentence(20)
			pro_lifecycle_id = lifecycle_list[rand(5)].id
			user_id = rand(5) + 1
			Project.create!(name: project_name,
							description: project_desc,
							lifecycle_id: pro_lifecycle_id,
							user_id: user_id)
		end

		deliverable_type_list = DeliverableType.all
		complexity_list = ["Low", "Medium", "High"]
		UoM_list = ["Document", "Lines of Code"]
		num_deliverable.times do |n|
			deliverable_name = Faker::Lorem.sentence(2)
			deliverable_desc = Faker::Lorem.sentence(20)
			deliverable_type_id = deliverable_type_list[rand(deliverable_type_list.size)].id
			deliverable_pro_id = rand(5) + 1
			cur_project = Project.find_by_id(deliverable_pro_id)
			phase_list = LifecyclePhase.find_all_by_lifecycle_id(cur_project.lifecycle_id)
			deliverable_phase_id = phase_list[rand(phase_list.size)].id
			deliverable_complexity = complexity_list[rand(complexity_list.size)]
			unit_of_measure = UoM_list[rand(UoM_list.size)]
			estimated_size = rand(10) + 1
			prod_rate = rand(10) + 1
			estimated_effort = estimated_size * prod_rate
			Deliverable.create!(name: deliverable_name,
								description: deliverable_desc,
								deliverable_type_id: deliverable_type_id,
								project_id: deliverable_pro_id,
								project_phase_id: deliverable_phase_id,
								complexity: deliverable_complexity,
								unit_of_measure: unit_of_measure,
								estimated_size: estimated_size,
								estimated_production_rate: prod_rate,
								estimated_effort: estimated_effort)
		end

		num_root_deliverable.times do |n|
			deliverable_name = Faker::Lorem.sentence(2)
			deliverable_desc = Faker::Lorem.sentence(20)
			deliverable_type_id = deliverable_type_list[rand(deliverable_type_list.size)].id
			deliverable_pro_list = Project.find_all_by_user_id(1)
			deliverable_pro_id = deliverable_pro_list[rand(deliverable_pro_list.size)].id
			cur_project = Project.find_by_id(deliverable_pro_id)
			phase_list = LifecyclePhase.find_all_by_lifecycle_id(cur_project.lifecycle_id)
			deliverable_phase_id = phase_list[rand(phase_list.size)].id
			deliverable_complexity = complexity_list[rand(complexity_list.size)]
			unit_of_measure = UoM_list[rand(UoM_list.size)]
			estimated_size = rand(10) + 1
			prod_rate = rand(10) + 1
			estimated_effort = estimated_size * prod_rate
			Deliverable.create!(name: deliverable_name,
								description: deliverable_desc,
								deliverable_type_id: deliverable_type_id,
								project_id: deliverable_pro_id,
								project_phase_id: deliverable_phase_id,
								complexity: deliverable_complexity,
								unit_of_measure: unit_of_measure,
								estimated_size: estimated_size,
								estimated_production_rate: prod_rate,
								estimated_effort: estimated_effort)
		end
	end
end

