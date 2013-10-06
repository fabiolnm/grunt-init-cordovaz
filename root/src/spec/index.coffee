# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
describe 'app', ->
  describe 'initialize', ->
    it 'should bind deviceready', ->
      runs ->
        spyOn app, 'onDeviceReady'
        app.initialize()
        helper.trigger window.document, 'deviceready'

      waitsFor helper.deviceReadyIsCalled, 'onDeviceReady should be called once', 500

      runs -> expect(app.onDeviceReady).toHaveBeenCalled()

  describe 'onDeviceReady', ->
    it 'should report that it fired', ->
      spyOn app, 'receivedEvent'
      app.onDeviceReady()
      expect(app.receivedEvent).toHaveBeenCalledWith 'deviceready'

  describe 'receivedEvent', ->
    beforeEach ->
      stage = document.createElement 'div'
      stage.id = 'stage'
      stage.innerHTML = """
                      <div id='deviceready'>
                          <p class='event listening'>Listening</p>
                          <p class='event received'>Received</p>
                      </div>
                      """
      document.body.appendChild stage

    it 'should hide the listening element', ->
        app.receivedEvent 'deviceready'
        displayStyle = helper.getComputedStyle '#deviceready .listening', 'display'
        expect(displayStyle).toEqual 'none'

    it 'should show the received element', ->
        app.receivedEvent 'deviceready'
        displayStyle = helper.getComputedStyle '#deviceready .received', 'display'
        expect(displayStyle).toEqual 'block'
