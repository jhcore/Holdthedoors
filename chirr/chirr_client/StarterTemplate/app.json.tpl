{
    /**
     * The toolkit to use. Select either "classic" or "modern".
     */
    "toolkit": "classic",

    /**
     * The application's namespace.
     */
    "name": "{name}",

    /**
     * The version of the application.
     */
    "version": "1.0.0.0",

    /**
     * The relative path to the appliaction's markup file (html, jsp, asp, etc.)
     */
    "indexHtmlPath": "index.html",

    /**
     * Comma-separated string with the paths of directories or files to search. Any classes
     * declared in these locations will be available in your class "requires" or in calls
     * to "Ext.require". The "app.dir" variable below is expanded to the path where the
     * application resides (the same folder in which this file is located).
     */
    "classpath": "$\u007bapp.dir}/app",

    "overrides": "$\u007bapp.dir}/overrides",

    /**
     * The Sencha Framework for this application: "ext" or "touch".
     */
    "framework": "ext",

    /**
     * The name of the theme for this application.
     */
	<tpl if="themeName == 'default'">
		"theme": "theme-crisp",
		/** 
		* Choose _one_ of the default Ext classic theme packages here:
		* "theme": "theme-gray",		
		* "theme": "ext-theme-neptune",
		* "theme": "theme-triton", 
		*     etc....
		*/
    <tpl else>
		"theme": "{themeName}",
    </tpl>
	

    /**
     * The list of required packages (with optional versions; default is "latest").
     *
     * For example,
     *
     *      "requires": [
     *          "sencha-charts"
     *      ]
     */
    "requires": [
        "devon-extjs"
    ],

    /**
     * Sass configuration properties.
     */
    "sass": {
        /**
         * The root namespace to use when mapping *.scss files to classes in the
         * sass/src and sass/var directories. For example, "Sample.view.Foo" would
         * map to "sass/src/view/Foo.scss". If we changed this to "Sample.view" then
         * it would map to "sass/src/Foo.scss". To style classes outside the app's
         * root namespace, change this to "". Doing so would change the mapping of
         * "Sample.view.Foo" to "sass/src/Sample/view/Foo.scss".
         */
        "namespace": "{name}"
    },

    /**
     * List of all JavaScript assets in the right execution order.
     *
     * Each item is an object with the following format:
     *
     *      {
     *          // Path to file. If the file is local this must be a relative path from
     *          // this app.json file.
     *          //
     *          "path": "path/to/script.js",   // REQUIRED
     *
     *          // Set to true on one file to indicate that it should become the container
     *          // for the concatenated classes.
     *          //
     *          "bundle": false,    // OPTIONAL
     *
     *          // Set to true to include this file in the concatenated classes.
     *          //
     *          "includeInBundle": false,  // OPTIONAL
     *
     *          // Specify as true if this file is remote and should not be copied into the
     *          // build folder. Defaults to false for a local file which will be copied.
     *          //
     *          "remote": false,    // OPTIONAL
     *
     *          // If not specified, this file will only be loaded once, and cached inside
     *          // localStorage until this value is changed. You can specify:
     *          //
     *          //   - "delta" to enable over-the-air delta update for this file
     *          //   - "full" means full update will be made when this file changes
     *          //
     *          "update": "",        // OPTIONAL
     *
     *          // A value of true indicates that is a development mode only dependency.
     *          // These files will not be copied into the build directory or referenced
     *          // in the generate app.json manifest for the micro loader.
     *          //
     *          "bootstrap": false   // OPTIONAL
     *      }
     *
     */
    "js": [
        // Javascript files are listed below in the environment-specific configuration
    ],

    /**
     * List of all CSS assets in the right inclusion order.
     *
     * Each item is an object with the following format:
     *
     *      {
     *          // Path to file. If the file is local this must be a relative path from
     *          // this app.json file.
     *          //
     *          "path": "path/to/stylesheet.css",   // REQUIRED
     *
     *          // Specify as true if this file is remote and should not be copied into the
     *          // build folder. Defaults to false for a local file which will be copied.
     *          //
     *          "remote": false,    // OPTIONAL
     *
     *          // If not specified, this file will only be loaded once, and cached inside
     *          // localStorage until this value is changed. You can specify:
     *          //
     *          //   - "delta" to enable over-the-air delta update for this file
     *          //   - "full" means full update will be made when this file changes
     *          //
     *          "update": ""      // OPTIONAL
     *      }
     */
    "css": [
        {
            "path": "bootstrap.css",
            "bootstrap": true
        }
    ],

    /**
     * This option is used to configure the dynamic loader. At present these options
     * are supported.
     *
     *      "loader": {
     *          // This property controls how the loader manages caching for requests:
     *          //
     *          //   - true: allows requests to receive cached responses
     *          //   - false: disable cached responses by adding a random "cache buster"
     *          //   - other: a string (such as the build.timestamp shown here) to allow
     *          //     requests to be cached for this build.
     *          //
     *          "cache": "$\u007bbuild.timestamp}",
     *
     *          // When "cache" is not true, this value is the request parameter used
     *          // to control caching.
     *          //
     *          "cacheParam": "_dc"
     *      },
     *
     */


    /**
     * override objects for setting build environment specific
     * settings.
     */
    "production": {
        "js": [
            {
                "path": "app/Config.js"
            },
            {
                "path": "$\u007bframework.dir}/build/ext-all-rtl-debug.js"
            },
            {
                "path": "app.js",
                "bundle": true
            }
        ]
    },

    "testing": {
        "js": [
            {
                "path": "app/Config.js"
            },
            {
                "path": "$\u007bframework.dir}/build/ext-all-rtl-debug.js"
            },
            {
                "path": "app.js",
                "bundle": true
            }
        ]
    },

    "development": {
        "js": [
            {
                "path": "app/Config.js"
            },
            {
                "path": "app/ConfigDevelopment.js"
            },
            {
                "path": "$\u007bframework.dir}/build/ext-all-rtl-debug.js"
            },
            {
                "path": "app.js",
                "bundle": true
            }
        ]
    },

    /**
     *  Controls the output structure of bootstrap artifacts.  May be specified by a string:
     *
     *      "bootstrap": "$\u007bapp.dir}"
     *
     *  to adjust the base path for all bootstrap objects, or expanded into object form:
     *
     *      "bootstrap": {
     *          "base": "$\u007bapp.dir},
     *          "manifest": "bootstrap.json",
     *          "microloader": "bootstrap.js",
     *          "css": "bootstrap.css"
     *      }
     *
     *  You can optionally exclude entries from the manifest. If you use ext-*.js,
     *  be sure to exclude "loadOrder" like so:
     *
     *      "bootstrap": {
     *          "manifest": {
     *              "path": "bootstrap.json",
     *              "exclude": "loadOrder"
     *          }
     *      }
     *
     */
    "bootstrap": {
        "base": "$\u007bapp.dir}",
        "manifest": "bootstrap.json",
        "microloader": "bootstrap.js",
        "css": "bootstrap.css"
    },

    /**
     *  Controls the output directory for build resources.  May be set with
     *  either a string:
     *
     *      "$\u007bworkspace.build.dir}/$\u007bbuild.environment}/$\u007bapp.name}"
     *
     *  or an object containing values for various types of
     *  build artifacts:
     *
     *      {
     *          "base": "$\u007bworkspace.build.dir}/$\u007bbuild.environment}/$\u007bapp.name}",
     *          "page": {
     *              "path": "../index.html",
     *              "enable": false
     *          },
     *          "css": "$\u007bapp.output.resources}/$\u007bapp.name}-all.css",
     *          "js": "app.js",
     *          "microloader": {
     *              "path": "microloader.js",
     *              "embed": true,
     *              "enable": true
     *          },
     *          "manifest": {
     *              "path": "app.json",
     *              "embed": false,
     *              "enable": "$\u007bapp.output.microloader.enable}"
     *          },
     *          "resources": "resources",
     *          "slicer": {
     *              "path": "$\u007bapp.output.resources}/images",
     *              "enable": false
     *          }
     *      }
     *
     */
    "output": {
        "base": "$\u007bworkspace.build.dir}/$\u007bbuild.environment}/$\u007bapp.name}"
    },

    /**
     * Used to automatically generate cache.manifest (HTML 5 application cache manifest) file when you build
     */
    "appCache": {
        /**
         * List of items in the CACHE MANIFEST section
         */
        "cache": [
            "index.html"
        ],
        /**
         * List of items in the NETWORK section
         */
        "network": [
            "*"
        ],
        /**
         * List of items in the FALLBACK section
         */
        "fallback": []
    },

    /**
     * Extra resources to be copied along when build
     */
    "resources": [
        "resources"
    ],

    /**
     * File / directory name matchers to ignore when copying to the builds, must be valid regular expressions
     */
    "ignore": [
        "(^|/)CVS(/?$|/.*?$)"
    ],

    /**
     * Directory path to store all previous production builds. Note that the content generated inside this directory
     * must be kept intact for proper generation of deltas between updates
     */
    "archivePath": "archive",

    /**
     * Additional resources used during theme slicing operations
     */
    "slicer": {
        "js": [
            {
                "path": "$\u007bapp.dir}/sass/example/custom.js",
                "isWidgetManifest": true
            }
        ]
    },

    /**
     * The space config object is used by the sencha app publish command to deploy this application to sencha space
     * "space": {
     *     // the space id for this application
     *     "id": 12345,
     *     // space host
     *     "host": "https://api.space.sencha.com/json.rpc",
     *     // can be a zip file path, or a folder to be zipped and deployd to sencha space
     *     "file": "$\u007bapp.output.base}",
     *     // These may be specified here, but are best specified in your user
     *     // ~/.sencha/cmd/sencha.cfg file
     *     "apiKey": "",
     *     "secret": ""
     * }
     */

    /**
     * Uniquely generated id for this application, used as prefix for localStorage keys.
     * Normally you should never change this value.
     */
    "id": "{uniqueId}"
}
