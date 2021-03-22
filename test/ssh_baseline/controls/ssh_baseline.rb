# copyright: 2018, The Authors

title 'ssh_baseline'

include_controls 'ssh-baseline' do
  skip_control 'ssh-09'
  skip_control 'ssh-22'
end
