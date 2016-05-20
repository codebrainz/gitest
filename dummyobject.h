#ifndef DUMMY_OBJECT_H_
#define DUMMY_OBJECT_H_ 1

#include <glib-object.h>

G_BEGIN_DECLS

#define DUMMY_TYPE_OBJECT (dummy_object_get_type())
GType dummy_object_get_type(void);
typedef struct DummySomeThing { gint some_value; } DummySomeThing;

G_END_DECLS

#endif /* DUMMY_OBJECT_H_ */
