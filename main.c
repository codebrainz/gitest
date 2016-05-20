#include "dummyobject.h"

int main() {
  g_object_unref(g_object_new(DUMMY_TYPE_OBJECT, NULL));
  return 0;
}
