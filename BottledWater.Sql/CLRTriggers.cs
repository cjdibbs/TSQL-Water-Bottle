using System;
using System.Data;
using System.Data.Sql;
using Microsoft.SqlServer.Server;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Xml;
using System.Text.RegularExpressions;
using System.IO;

public class CLRTriggers {
    public static void Log4Net() {
        SqlTriggerContext triggContext = SqlContext.TriggerContext;

        File.WriteAllLines(@"C:\logs\BottledWater\log.txt",
            new string[] {
                    String.Format("Sql Event Recorded: {0}", Enum.GetName(typeof(TriggerAction), triggContext.TriggerAction)),
                    triggContext.EventData.ToString()
            }
        );
    }
}