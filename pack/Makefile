KNL_FILE = $(POLICY_OBJ_DIR)/kernel
IMAGE    = $(OBJ_DIR)/muen.img

HASHED_BINS = \
	$(wildcard $(POLICY_OBJ_DIR)/sm) \
	$(wildcard $(POLICY_OBJ_DIR)/bzImage)

include ../Makeconf

DUMMY := $(shell mkdir -p $(OBJ_DIR))

all: $(IMAGE)

$(POLICY_B_HASH): $(POLICY_B) $(MUCFGMEMHASHES) $(MUGENSINFO) $(HASHED_BINS)
	$(MUCFGMEMHASHES) -i $(POLICY_OBJ_DIR) $(POLICY_B) $(POLICY_B_HASH)
	$(MUGENSINFO) -o $(POLICY_OBJ_DIR) $(POLICY_B_HASH)

$(IMAGE): $(KNL_FILE) $(POLICY_B_HASH)
	$(MUPACK) -i $(POLICY_OBJ_DIR) -o $(OBJ_DIR) $(POLICY_B_HASH)

clean:
	@rm -rf $(OBJ_DIR)

.PHONY: $(IMAGE)
