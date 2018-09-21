#include "log.as"
#include "helpers.as"

// --------------------------------------------
abstract class Tracker {

	// general time based update
	void update(float time) {}

	// match status events
	protected void handleMatchEndEvent(const XmlElement@ event) {}
	protected void handleFactionLoseEvent(const XmlElement@ event) {}
	// base state events
	protected void handleBaseOwnerChangeEvent(const XmlElement@ event) {}
	// comms services state events
	protected void handleCommsChangeEvent(const XmlElement@ event) {}
	// vehicle state events
	protected void handleVehicleSpawnEvent(const XmlElement@ event) {}
	protected void handleVehicleHolderChangeEvent(const XmlElement@ event) {}
	protected void handleVehicleDestroyEvent(const XmlElement@ event) {}
	// chat events
	protected void handleChatEvent(const XmlElement@ event) {}
	// results for script issued queries
	protected void handleQueryResultEvent(const XmlElement@ event) {}
	// player events
	protected void handlePlayerConnectEvent(const XmlElement@ event) {}
	protected void handlePlayerDisconnectEvent(const XmlElement@ event) {}
	protected void handlePlayerSpawnEvent(const XmlElement@ event) {}
	protected void handlePlayerKillEvent(const XmlElement@ event) {}
	protected void handlePlayerDieEvent(const XmlElement@ event) {}
	protected void handlePlayerStunEvent(const XmlElement@ event) {}
	protected void handlePlayerWoundEvent(const XmlElement@ event) {}
	// hitbox events
	protected void handleHitboxEvent(const XmlElement@ event) {}
	// item events
	protected void handleItemDropEvent(const XmlElement@ event) {}
	// character events
	// not delivered by default, enable with:
	// * <command class="set_metagame_event" name="character_spawn" enabled="1" />
	// * <command class="set_metagame_event" name="character_die" enabled="1" />
	// * <command class="set_metagame_event" name="character_kill" enabled="1" />
	protected void handleCharacterSpawnEvent(const XmlElement@ event) {}
	protected void handleCharacterDieEvent(const XmlElement@ event) {}
	protected void handleCharacterKillEvent(const XmlElement@ event) {}
	// call events, happens for calls that have marked themselves for notification
	protected void handleCallRequestEvent(const XmlElement@ event) {}

	void handleEvent(const XmlElement@ event) {
		if (event is null) {
			_log("WARNING, event is null at handleEvent");
			return;
		}

		// check message type and dispatch to a handler
		string rootName = event.getName();
		//_log("tracker, rootName: " + rootName, 1);
		if (rootName == "match_result") {
			handleMatchEndEvent(event);
		} else if (rootName == "query_result") {
			handleQueryResultEvent(event);
		} else if (rootName == "comms_change_event") {
			handleCommsChangeEvent(event);
		} else if (rootName == "vehicle_spawn_event") {
			handleVehicleSpawnEvent(event);
		} else if (rootName == "vehicle_holder_change_event") {
			handleVehicleHolderChangeEvent(event);
		} else if (rootName == "vehicle_destroyed_event") {
			handleVehicleDestroyEvent(event);
		} else if (rootName == "base_owner_change_event") {
			handleBaseOwnerChangeEvent(event);
		} else if (rootName == "chat_event") {
			handleChatEvent(event);
		} else if (rootName == "player_connect_event") {
			handlePlayerConnectEvent(event);
		} else if (rootName == "player_disconnect_event") {
			handlePlayerDisconnectEvent(event);
		} else if (rootName == "player_spawn") {
			handlePlayerSpawnEvent(event);
		} else if (rootName == "player_kill") {
			handlePlayerKillEvent(event);
		} else if (rootName == "player_die") {
			handlePlayerDieEvent(event);
		} else if (rootName == "player_stun") {
			handlePlayerStunEvent(event);
		} else if (rootName == "player_wound") {
			handlePlayerWoundEvent(event);
		} else if (rootName == "hitbox_event") {
			handleHitboxEvent(event);
		} else if (rootName == "dummy_event") {
		} else if (rootName == "faction_lost") {
			handleFactionLoseEvent(event);
		} else if (rootName == "item_drop_event") {
			handleItemDropEvent(event);
		} else if (rootName == "character_spawn") {
			handleCharacterSpawnEvent(event);
		} else if (rootName == "character_die") {
			handleCharacterDieEvent(event);
		} else if (rootName == "character_kill") {
			handleCharacterKillEvent(event);
		} else if (rootName == "call_request_event") {
			handleCallRequestEvent(event);
		} else {
			_log("unhandled message: " + rootName, 1);
		}
	}

	void start() {}
	void end() {}

	bool hasStarted() const { return false; }
	bool hasEnded() const { return false; }

	void gameContinuePreStart() {}

	void onAdd() {}
	void onRemove() {}
}
