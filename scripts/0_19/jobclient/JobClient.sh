JTG_CLASSPATH="`dirname $0`/../../hadoop-cacti-jtg.jar"
JTG_CLASSNAME="com.jointhegrid.hadoopjmx.jobclient.JobClientFactory"

HADOOP_VERSION="0_19"
#change these to point at your hadoop path
HADOOP_CORE="`dirname $0`/../../hadoop-0.19/hadoop-0.19-core.jar"
HADOOP_EXTRA_LIBS="`dirname $0`/../../hadoop-0.19/lib"
HADOOP_CONF=$1

if [ ! -f $HADOOP_CORE ] ; then
  echo "$HADOOP_CORE not found"
  exit 1
fi

if [ ! -d $HADOOP_EXTRA_LIBS ] ; then
  echo "$HADOOP_EXTRA_LIBS not found"
  exit 2
fi

for f in ${HADOOP_EXTRA_LIBS}/*.jar ; do
  echo $f
  JTG_CLASSPATH=${JTG_CLASSPATH}:$f
done

JTG_CLASSPATH=${HADOOP_CORE}:${JTG_CLASSPATH}
echo $JTG_CLASSPATH

java -cp ${JTG_CLASSPATH} ${JTG_CLASSNAME} $HADOOP_VERSION "$@"
