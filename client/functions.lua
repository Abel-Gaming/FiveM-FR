function StopPed()
      StoppedPed = lib.getClosestPed(GetEntityCoords(PlayerPedId()), 3.0)
      if StoppedPed then
            TaskStandStill(StoppedPed, -1)
            lib.notify({title = 'Ped Stopped',type = 'success'})
      else
            lib.notify({title = 'Error', description = 'No ped nearby' , type = 'error'})
      end
end

function ReleasePed()
      if StoppedPed then
            ClearPedTasksImmediately(StoppedPed)
            StoppedPed = nil
            lib.notify({title = 'Ped Released',type = 'success'})
      end
      if ArrestedPed then
            ClearPedTasksImmediately(ArrestedPed)
            ArrestedPed = nil
            lib.notify({title = 'Arrested Ped Released',type = 'success'})
      end
end

function ArrestPed()
      if StoppedPed then
            RequestAnimDict("mp_arresting")
		while not HasAnimDictLoaded("mp_arresting") do
			Citizen.Wait(100)
		end
            local player = PlayerPedId()
            TaskPlayAnim(player, "mp_arresting", "a_uncuff", 8.0, -8, -1, 49, 0, 0, 0, 0)
		TaskPlayAnim(StoppedPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(StoppedPed, player, 11816, 0, 0.6, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		Citizen.Wait (2000)
		DetachEntity(StoppedPed, true, false)
		ClearPedSecondaryTask(player)
		TaskPlayAnim(StoppedPed, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
		Citizen.Wait (1000)
		TaskPlayAnim(StoppedPed, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
            TaskStandStill(StoppedPed, -1)
            TaskPlayAnim(StoppedPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
            ArrestedPed = StoppedPed
            StoppedPed = nil
            lib.notify({title = 'Ped Arrested',type = 'success'})
      else
            lib.notify({title = 'Error', description = 'No ped stopped' , type = 'error'})
      end
end

function GrabPed()
      if ArrestedPed then
            local player = PlayerPedId()
            if isPedBeingGrabbed == false then
                  AttachEntityToEntity(ArrestedPed, player, 11816, -0.3, 0.4, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                  SetBlockingOfNonTemporaryEvents(ArrestedPed, true)
                  GrabbedPed = ArrestedPed
                  isPedBeingGrabbed = true
                  lib.notify({title = 'Ped Grabbed',type = 'success'})
            elseif isPedBeingGrabbed == true then
                  DetachEntity(GrabbedPed, true, false)
                  Citizen.Wait(1500)
                  TaskStandStill(ArrestedPed, -1)
                  Citizen.Wait(500)
                  TaskPlayAnim(ArrestedPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
                  isPedBeingGrabbed = false
                  GrabbedPed = nil
                  lib.notify({title = 'Ped Released',type = 'success'})
            end
      else
            lib.notify({title = 'Error', description = 'No ped arrested' , type = 'error'})
      end
end

function KneelPed()
      if ArrestedPed then
            local player = PlayerPedId()
            if isPedKneeling == false then
                  TaskPlayAnim(ArrestedPed, "random@arrests", "idle_2_hands_up", 8.0, 2.0, -1, 2, 0, 0, 0, 0 )
                  Citizen.Wait(4000)
                  TaskPlayAnim(ArrestedPed, "random@arrests@busted", "enter", 8.0, 3.0, -1, 2, 0, 0, 0, 0 )
                  Citizen.Wait(500)
                  TaskPlayAnim(ArrestedPed, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
                  isPedKneeling = true
            else
                  TaskPlayAnim(ArrestedPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
                  Citizen.Wait(2000)
                  TaskPlayAnim(ArrestedPed, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                  Citizen.Wait(2000)
                  TaskPlayAnim(ArrestedPed, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
                  Citizen.Wait(2000)
                  SetBlockingOfNonTemporaryEvents(ArrestedPed, true)
                  TaskStandStill(ArrestedPed, -1)
                  TaskPlayAnim(ArrestedPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
                  isPedKneeling = false
            end
      else
            lib.notify({title = 'Error', description = 'No ped arrested' , type = 'error'})
      end
end