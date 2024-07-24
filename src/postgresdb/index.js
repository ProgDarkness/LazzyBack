import promise from 'bluebird'
import pgPromise from 'pg-promise'
import conexion1Config from '../../postgres-bd-1.json'
import mssql from 'mssql'
import conexion2Config from '../../postgres-bd-2.json'
// import {Diagnostics} from './diagnostics'

const initOptions = {
  promiseLib: promise
}

const pool = new mssql.ConnectionPool(conexion2Config)
const slqserver = pool.connect()

slqserver
  .then(() => {
    console.log('Connected to SQL Server')
  })
  .catch((err) => {
    console.log(err.message)
  })

const pgp = pgPromise(initOptions)
export const db1 = pgp(conexion1Config)
export const db2 = pool
// export const db2 = pgp(conexion2Config)
// Diagnostics.init(initOptions);
