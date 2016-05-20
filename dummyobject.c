#include "dummyobject.h"

typedef struct { GObject parent; } DummyObject;
typedef struct { GObjectClass parent_class; } DummyObjectClass;
static guint fake_signal;

G_DEFINE_TYPE(DummyObject, dummy_object, G_TYPE_OBJECT)

static void dummy_object_class_init(DummyObjectClass *klass) {

  fake_signal = g_signal_new("fake", DUMMY_TYPE_OBJECT, G_SIGNAL_RUN_FIRST, 0,
                             NULL, NULL, NULL, G_TYPE_NONE, 1, G_TYPE_POINTER);
}

static void dummy_object_init(DummyObject *self) {}
