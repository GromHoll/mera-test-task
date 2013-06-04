dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/dev?useUnicode=yes&characterEncoding=UTF-8"
            username = "npavlov"
            password = "npavlov"
        }		
		hibernate {
			show_sql = false
		}
    }
    test {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/test?useUnicode=yes&characterEncoding=UTF-8"
            username = "npavlov"
            password = "npavlov"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/dev?useUnicode=yes&characterEncoding=UTF-8"
            username = "npavlov"
            password = "npavlov"
        }
    }
}
