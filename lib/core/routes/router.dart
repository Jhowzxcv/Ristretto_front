import 'package:go_router/go_router.dart';
import 'package:ristretto/core/routes/MainApp.dart';

// Main App Screens
import 'package:ristretto/features/tasks/presentation/tasks_screen.dart';
import 'package:ristretto/features/calendar/presentation/calendar_screen.dart';
import 'package:ristretto/features/lists/presentation/lists_screen.dart';
import 'package:ristretto/features/lists/presentation/add_list_screen.dart';
import 'package:ristretto/features/timer/presentation/timer_screen.dart';
import 'package:ristretto/features/user/presentation/user_screen.dart';

// Authentication Screens
import 'package:ristretto/features/login/presentation/login_screen.dart';
import 'package:ristretto/features/register/presentation/register_screen.dart';

// Router
final GoRouter router=GoRouter(
  initialLocation:'/register',
  // initialLocation:'/tasks',
  routes:[
    // Main App routing
    StatefulShellRoute.indexedStack(
      builder:(context,state,navigationShell)=>
        MainApp(navigationShell:navigationShell),
      branches:[
        StatefulShellBranch(
          routes:[
            GoRoute(
              path:'/tasks',
              builder:(context,state)=>TasksScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes:[
            GoRoute(
              path:'/calendar',
              builder:(context,state)=>CalendarScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes:[
            GoRoute(
              path:'/add-task',
              builder:(context,state)=>ListsScreen(),
            ),
            GoRoute(
              path:'/add-list',
              builder:(context,state)=>AddListScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes:[
            GoRoute(
              path:'/timer',
              builder:(context,state)=>TimerScreen(),
            )
          ],
        ),
        StatefulShellBranch(
          routes:[
            GoRoute(
              path:'/user',
              builder:(context,state)=>UserScreen(),
            )
          ],
        ),
      ],
    ),
    // Authentication routing
    GoRoute(
      path:'/login',
      builder:(context,state)=>LoginScreen(),
    ),
    GoRoute(
      path:'/register',
      builder:(context,state)=>RegisterScreen(),
    ),
  ],
);
