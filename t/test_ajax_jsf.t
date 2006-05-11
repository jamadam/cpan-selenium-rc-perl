#!/usr/bin/perl
# Copyright 2006 ThoughtWorks, Inc.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

use Test::WWW::Selenium;

use lib 't/lib';
use SeleniumUtil qw(server_is_running);
use Test::More;

plan skip_all => "Bug SRC-55!";
exit 0;

if (server_is_running) {
    plan tests => 6;
}
else {
    plan skip_all => "No selenium server found!";
    exit 0;
}

my $sel = Test::WWW::Selenium->new( host => "localhost", 
                                      port => 4444, 
                                      browser => "*firefox", 
                                      browser_url => "http://www.irian.at",
                                    );
$sel->open_ok("http://www.irian.at/myfaces-sandbox/inputSuggestAjax.jsf");
$sel->is_text_present_ok("suggest");
#
# disabled pending DOJO combobox trouble issue resolution (http://jira.openqa.org/browse/SRC-55)
#
#$id = "_idJsp0:_idJsp3";
#$sel->type_ok($id, "foo");
#$sel->key_down_ok($id, 120);
#$sel->key_press_ok($id, 120);
#sleep 1;
#$sel->assert_text_present_ok("regexp:foox?1");
