################################################################################
#
#      Author: Stephen Nelson-Smith <stephen@atalanta-systems.com>
#      Author: Zachary Patten <zachary@jovelabs.com>
#   Copyright: Copyright (c) 2011-2013 Atalanta Systems Ltd
#     License: Apache License, Version 2.0
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
################################################################################

module Cucumber::Chef::Helpers::Chef

################################################################################

  def create_data_bag(data_bag, data_bag_path)
    $cc_client.test_lab.knife_cli(%Q{data bag create "#{data_bag}"}, :silence => true)
    $cc_client.test_lab.knife_cli(%Q{data bag from file "#{data_bag}" "#{data_bag_path}"}, :silence => true)
  end

  def delete_data_bag(data_bag)
    $cc_client.test_lab.knife_cli(%Q{data bag delete "#{data_bag}" --yes}, :silence => true)
  end

################################################################################

  def role_from_file(role, role_path)
    if File.extname(role).empty?
      Dir.glob(File.join(role_path, "#{role}.*")).each do |role_file|
        $cc_client.test_lab.knife_cli(%Q{role from file #{role_file}}, :silence => true)
      end
    else
      $cc_client.test_lab.knife_cli(%Q{role from file #{File.join(role_path, role)}}, :silence => true)
    end
  end

end

################################################################################
