desc 'This task does 2 threads'

task :test do

  sh 'mkdir reporting'
  sh 'cucumber features/api.feature --format json --out "reporting/cucumber.json"'


  # %W['mkdir reporting', cucumber features/api.feature --format json --out "reporting/cucumber.json"'].each do |cmd|
  #   sh "#{cmd}"
  # end
  %W[create_dir run_cucumber].each do |cmd|
    sh "rake #{cmd}"
  end
end

task :create_dir do
  sh 'mkdir reporting'
  Dir.mkdir 'test_reports' unless Dir.exist? 'test_reports'
end

task :run_cucumber do
  sh 'cucumber features/api.feature --format json --out "reporting/cucumber.json"'
end

task :run_2 do
  started_at = Time.now
  puts "[35m Started At #{started_at} [0m"
  sh 'rake create_dir'

  # t1 = Thread.new {sh 'cucumber features/api.feature --format json --out "reporting/cucumber_1.json"'}
  t1 = Thread.new {sh 'cucumber features/api.feature -p html_report'}

  # t2 = Thread.new {sh 'cucumber features/log_in_with_helper.feature --format json --out "reporting/cucumber_2.json"'}
  t2 = Thread.new {sh 'cucumber features/log_in_with_helper.feature -p json_report'}

  t1.join
  t2.join

  finished_at = Time.now
  run_took = Time.at(finished_at - started_at).utc.strftime('%H:%M:%S')
  puts "[35m Started At #{finished_at} [0m"
  puts "[35m Started At #{run_took} [0m"

end