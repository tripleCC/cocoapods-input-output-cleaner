require 'cocoapods-input-output-cleaner/command'

Pod::HooksManager.register('cocoapods-input-output-cleaner', :post_install) do |context, _|
# CocoaPods 1.5.0 修复了此问题
#
# fix `Shell Script` Build Phase Fails When Input / Output Files List is Too Large
	Pod::UI.section('Tdfire: auto clean input and output files') do
		context.umbrella_targets.map(&:user_targets).flatten.uniq.each do |t|
      phase = t.shell_script_build_phases.find { |p| p.name.include?(Pod::Installer::UserProjectIntegrator::TargetIntegrator::COPY_PODS_RESOURCES_PHASE_NAME) }
      next unless phase 
      
      max_input_output_paths = 0
      input_output_paths = phase.input_paths.count + phase.output_paths.count
      Pod::UI.message "Tdfire: input paths and output paths count for #{t.name} : #{input_output_paths}"

      if input_output_paths > max_input_output_paths
      	phase.input_paths.clear
      	phase.output_paths.clear
      end
    end

    context.umbrella_targets.map(&:user_project).each do |project|
      project.save
    end
	end

end